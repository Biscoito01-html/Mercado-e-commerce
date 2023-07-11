import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minimercado/data/data.dart';
import 'package:minimercado/models/produtos_modules.dart';
import 'package:get/get.dart';

class Relatorios extends StatelessWidget {
  Relatorios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Icon(Icons.keyboard_return)),
        title: Text('Relatorios'),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: DatabaseManager.relatorioFindAll(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Produtos>> snapshot) {
                if (snapshot.hasData) {
                  final List<Produtos> produto = snapshot.data!;

                  return ListView.builder(
                      itemCount: produto.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Produtos produt = produto[index];

                        return Column(
                          children: [
                            Row(
                              children: [
                                Text("${produt.descricao}"),
                                Text("${produt.estoque}"),
                                Text("${produt.unidadeDeMedida}"),
                                Text("${produt.validade}"),
                              ],
                            )
                          ],
                        );
                      });
                } else if (snapshot.hasError) {
                  return const Text('Erro ao carregar os produtos');
                } else {
                  return const CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}
