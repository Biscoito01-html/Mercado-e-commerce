import 'package:minimercado/models/produtos_modules.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'mercado.db');
    return openDatabase(path, onCreate: (db, version) {
      _createProdutosTable(db);
      _createComprasTable(db);
    }, version: 1);
  }

  static const String _tableName = 'produtos';

  static void _createProdutosTable(Database db) {
    db.execute('''
      CREATE TABLE produtos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT,
        unidadeDeMedida TEXT,
        estoque INTEGER,
        estoqueMinimo INTEGER,
        precoDeCusto REAL,
        outrosCustos REAL,
        margem REAL,
        validade TEXT
        ''');
  }

  static void _createComprasTable(Database db) {
    db.execute('''
      CREATE TABLE compras(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        descricao TEXT, 
        unidadeDeMedida TEXT, 
        estoque INTEGER, 
        estoqueMinimo INTEGER, 
        precoDeCusto REAL, 
        outrosCustos REAL, 
        margem REAL, 
        validade TEXT, 
        )
          ''');
  }

  static Future<void> insertProduto(Produtos produto) async {
    final db = await getDatabase();
    await db.insert(
      _tableName,
      produto.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Produtos>> findAll() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (index) {
      return Produtos(
        id: maps[index]['id'],
        descricao: maps[index]['descricao'],
        unidadeDeMedida: maps[index]['unidadeDeMedida'],
        estoque: maps[index]['estoque'],
        estoqueMinimo: maps[index]['estoqueMinimo'],
        precoDeCusto: maps[index]['precoDeCusto'],
        outrosCustos: maps[index]['outrosCustos'],
        margem: maps[index]['margem'],
        validade: maps[index]['validade'],
      );
    });
  }

  static Future<void> updateProduto(
      Produtos produto, int quantidadeReduzida) async {
    final db = await getDatabase();

    // Obtenha o valor atual do estoque do banco de dados
    final Map<String, dynamic> produtoAtual = await db
        .query(
          _tableName,
          where: 'id = ?',
          whereArgs: [produto.id],
          limit: 1,
        )
        .then((value) => value.first);

    // Calcule a nova quantidade de estoque reduzida
    final int novoEstoque = produtoAtual['estoque'] - quantidadeReduzida;

    // Crie um novo mapa de valores com a nova quantidade de estoque
    final Map<String, dynamic> novoProduto = {
      'estoque': novoEstoque,
    };

    // Atualize o produto no banco de dados
    await db.update(
      _tableName,
      novoProduto,
      where: 'id = ?',
      whereArgs: [produto.id],
    );
  }

  static Future<void> deleteProduto(int id) async {
    final db = await getDatabase();
    await db.delete(
      'produtos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<void> insertCompras(Produtos produto) async {
    final db = await getDatabase();
    await db.insert("compras", produto.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Produtos>> relatorioFindAll() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> mapa = await db.query("compras");

    return List.generate(mapa.length, (index) {
      return Produtos(
        id: mapa[index]['id'],
        descricao: mapa[index]['descricao'],
        unidadeDeMedida: mapa[index]['unidadeDeMedida'],
        estoque: mapa[index]['estoque'],
        estoqueMinimo: mapa[index]['estoqueMinimo'],
        precoDeCusto: mapa[index]['precoDeCusto'],
        outrosCustos: mapa[index]['outrosCustos'],
        margem: mapa[index]['margem'],
        validade: mapa[index]['validade'],
      );
    });
  }
}
