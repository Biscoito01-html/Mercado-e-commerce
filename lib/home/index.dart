import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimercado/vendas/produtos_vendas_sales.dart';
import 'package:minimercado/vendas/resumo_produtos_sales.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Icon(Icons.keyboard_return)),
            bottom: const TabBar(tabs: [
              Tab(
                text: "Produtos",
              ),
              Tab(
                text: "Resumo",
              ),
            ]),
            title: const Text('Home'),
          ),
          body: const TabBarView(
            children: [Vendas_produtos(),Resumo_Vendas_compras() ],
          ),
        ),
      ),
    );
  }
}
