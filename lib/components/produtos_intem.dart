import 'package:flutter/material.dart';
import 'package:minimercado/data/data.dart';
import 'package:minimercado/models/produtos_modules.dart';


class Card_produtos_apresentacao extends StatelessWidget {
   

  Card_produtos_apresentacao({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Produtos>>(
      future: DatabaseManager.findAll(),
      builder: (BuildContext context, AsyncSnapshot<List<Produtos>> snapshot) {
        if (snapshot.hasData) {
          final List<Produtos> produtos = snapshot.data!;
          // Construa o widget com base na lista de produtos
          return ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (BuildContext context, int index) {
              final Produtos produto = produtos[index];
              // Construa um widget para exibir cada produto na lista
              return InkWell(
                onTap: () {
                 
                },
                child: Card(
                  child: Column(
                    children: [
                      Text('${produto.descricao}'),
                      Text("${produto.estoqueMinimo}"),
                      Text("vence ${produto.validade}"),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Text('Erro ao carregar os produtos');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
