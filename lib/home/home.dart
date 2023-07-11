import 'package:flutter/material.dart';

import 'package:minimercado/Estoquedeprodutos/index.dart';
import 'package:get/get.dart';
import 'package:minimercado/home/index.dart';
import 'package:minimercado/relatorios/index.dart';

class Home_items extends StatelessWidget {
  Home_items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento'),
      ),
      body: Column(children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[100]),
                  child: InkWell(
                    onTap: () {
                      Get.to(Home());
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.point_of_sale_sharp,
                          size: 50,
                          color: Colors.blue,
                        ),
                        Text("Vendas", style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[100]),
                  child: InkWell(
                    onTap: () {
                      Get.to(Relatorios());
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.receipt_long,
                          size: 50,
                          color: Colors.blue,
                        ),
                        Text("Relatorio", style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[100]),
                  child: InkWell(
                    onTap: () {
                      Get.to(Estoque_Produtos());
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.confirmation_number,
                          size: 50,
                          color: Colors.blue,
                        ),
                        Text("Estoque", style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[100]),
                  child: InkWell(
                    onTap: () {},
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.confirmation_number,
                          size: 50,
                          color: Colors.blue,
                        ),
                        Text("Estoque", style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
