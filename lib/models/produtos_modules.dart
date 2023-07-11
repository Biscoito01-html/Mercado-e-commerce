import 'package:get/get.dart';

class Produtos extends GetxController {
  int? id;
  String? descricao;
  String? unidadeDeMedida;
  int? estoque;
  int? estoqueMinimo;
  double? precoDeCusto;
  double? outrosCustos;
  double? margem;
  String? validade;

  Produtos({
    this.id,
    this.descricao,
    this.unidadeDeMedida,
    this.estoque,
    this.estoqueMinimo,
    this.precoDeCusto,
    this.outrosCustos,
    this.margem,
    this.validade,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'unidadeDeMedida': unidadeDeMedida,
      'estoque': estoque,
      'estoqueMinimo': estoqueMinimo,
      'precoDeCusto': precoDeCusto,
      'outrosCustos': outrosCustos,
      'margem': margem,
      'validade': validade
    };
  }
  
  @override
  String toString() {
    return 'Produtos{id: $id, descricao: $descricao, unidadeDeMedida: $unidadeDeMedida, estoque: $estoque, estoqueMinimo: $estoqueMinimo, precoDeCusto: $precoDeCusto, outrosCustos: $outrosCustos, margem: $margem, validade: $validade}';
  }
}


/* 
 String validarDataValidade() {
    if (validade == null) {
      return 'Data de validade não definida';
    }

    DateTime dataValidade = DateFormat('dd/MM/yyyy').parse(validade!);
    DateTime dataAtual = DateTime.now();

    if (dataValidade.isBefore(dataAtual)) {
      return 'Produto vencido';
    } else if (dataValidade.difference(dataAtual).inDays <= 10) {
      return 'Produto prestes a vencer';
    } else if (dataValidade == dataAtual) {
      return 'Produto vencerá hoje';
    }

    return 'Data de validade válida';
  }

 */