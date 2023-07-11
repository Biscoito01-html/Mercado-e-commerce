import 'package:get/get.dart';
import 'package:minimercado/models/produtos_modules.dart';

class Modelo_vendas_inicial extends GetxController {
  RxList<Produtos> bancodevendas = <Produtos>[].obs;

  List<Map<String, dynamic>> mapeado() {
    return bancodevendas.map((element) {
      return {
        'id': element.id,
        'descricao': element.descricao,
        'unidadeDeMedida': element.unidadeDeMedida,
        'estoque': element.estoque,
        'estoqueMinimo': element.estoqueMinimo,
        'precoDeCusto': element.precoDeCusto,
        'outrosCustos': element.outrosCustos,
        'margem': element.margem,
        'validade': element.validade
      };
    }).toList();
  }
}
