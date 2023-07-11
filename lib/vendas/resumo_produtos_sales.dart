import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:minimercado/models/vendas_produtos.dart';

class Resumo_Vendas_compras extends StatelessWidget {
  const Resumo_Vendas_compras({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Modelo_vendas_inicial>(
      builder: (_) {
        final total = _.bancodevendas.fold<double>(
          0.0,
          (previousValue, produto) => previousValue + produto.precoDeCusto!,
        );

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _.bancodevendas.length,
                itemBuilder: (context, index) {
                  final interado = _.bancodevendas[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${interado.descricao}'),
                          Text("${interado.unidadeDeMedida}"),
                          Text("${interado.precoDeCusto}")
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Text(
              "Total: ${total.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Pagamento'),
              ),
            ),
          ],
        );
      },
    );
  }
}
