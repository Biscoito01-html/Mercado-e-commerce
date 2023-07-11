import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:minimercado/components/produtos_intem.dart";
import "package:minimercado/formulariocadastrocliente/index.dart";

class Estoque_Produtos extends StatelessWidget {
  const Estoque_Produtos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque'),
      ),
      body: Card_produtos_apresentacao(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const Formulario_de_cadastro_de_produtos());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
