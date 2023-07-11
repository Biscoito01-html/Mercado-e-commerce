class Modelo_Vendas_Produtos {
  int? id;
  String? descricao;
  String? unidadeDeMedida;
  int? estoque;
  int? estoqueMinimo;
  double? precoDeCusto;
  double? outrosCustos;
  double? margem;
  String? validade;

  Modelo_Vendas_Produtos({
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
    return 'Vendas{id: $id, descricao: $descricao, unidadeDeMedida: $unidadeDeMedida, estoque: $estoque, estoqueMinimo: $estoqueMinimo, precoDeCusto: $precoDeCusto, outrosCustos: $outrosCustos, margem: $margem, validade: $validade}';
  }
}
