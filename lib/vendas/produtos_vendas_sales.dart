import 'package:flutter/material.dart';
import 'package:minimercado/models/produtos_modules.dart';
import 'package:minimercado/models/vendas_produtos.dart';
import 'package:get/get.dart';

import '../data/data.dart';

class Vendas_produtos extends StatefulWidget {
  const Vendas_produtos({super.key});

  @override
  State<Vendas_produtos> createState() => _Vendas_produtosState();
}

var interno = 0.obs;

class _Vendas_produtosState extends State<Vendas_produtos> {
  TextEditingController _name = TextEditingController();
  final modeloVendas = Get.put(Modelo_vendas_inicial());

  soma() {
    return interno++;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _name,
            decoration: InputDecoration(
              hintText: "Qual produto voce deseja",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    "Todos",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    "Alimentos",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    "Bar e restaurantes",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    "Bebidas",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    "Decorações",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    "Eletroportateis",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: FutureBuilder<List<Produtos>>(
          future: DatabaseManager.findAll(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Produtos>> snapshot) {
            if (snapshot.hasData) {
              final List<Produtos> produtos = snapshot.data!;
              // Construa o widget com base na lista de produtos
              return Column(
                children: [
                  SizedBox(
                      width: 380,
                      height: 50,
                      child: Card(
                          child: Obx(() =>
                              Text(" Itens no carrinho : ${interno.string}")))),
                  Expanded(
                    child: ListView.builder(
                      itemCount: produtos.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Produtos produto = produtos[index];
                        // Construa um widget para exibir cada produto na lista
                        return InkWell(
                          onTap: () {
                            soma();
                            final item = Produtos(
                                id: produto.id,
                                descricao: produto.descricao,
                                unidadeDeMedida: produto.unidadeDeMedida,
                                estoque: produto.estoque,
                                estoqueMinimo: produto.estoqueMinimo,
                                precoDeCusto: produto.precoDeCusto,
                                outrosCustos: produto.outrosCustos,
                                margem: produto.margem,
                                validade: produto.validade);
                            modeloVendas.bancodevendas.add(item);
                            DatabaseManager.insertCompras(item);
                          },
                          child: Card(
                            child: Column(
                              children: [
                                Text('${produto.descricao}'),
                                Text("${produto.estoqueMinimo}"),
                                Text(
                                  "vence ${produto.validade}",
                                  style: TextStyle(
                                      color: produto.validade!.contains("2023")
                                          ? Colors.green
                                          : Colors.red),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar os produtos');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ))
      ],
    );
  }
}
