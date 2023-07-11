import 'package:flutter/material.dart';
import 'package:minimercado/data/data.dart';
import 'package:minimercado/models/produtos_modules.dart';

class Formulario_de_cadastro_de_produtos extends StatefulWidget {
  const Formulario_de_cadastro_de_produtos({super.key});

  @override
  State<Formulario_de_cadastro_de_produtos> createState() =>
      _Formulario_de_cadastro_de_produtosState();
}

class _Formulario_de_cadastro_de_produtosState
    extends State<Formulario_de_cadastro_de_produtos> {
  List<String> opcoes = ['UN', 'KG', 'LT'];
  String? opcaoSelecionada;

  TextEditingController Descricao = TextEditingController();
  TextEditingController Detalhamento_Descricao = TextEditingController();
  TextEditingController Quantidade_Informado = TextEditingController();
  TextEditingController Estoque_Minimo = TextEditingController();
  TextEditingController Preco_De_Custo = TextEditingController();
  TextEditingController Outros_Custos = TextEditingController();
  TextEditingController Margem_Custos = TextEditingController();
  TextEditingController Validade_Informado = TextEditingController();

  final _validacao = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: Form(
        key: _validacao,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: const SizedBox(
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.photo_camera,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  controller: Descricao,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("*Descrição")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  controller: Detalhamento_Descricao,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Descrição detalhada do produto"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatorio';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Selecione a unidade",
                    ),
                    value: opcaoSelecionada,
                    onChanged: (newValue) {
                      setState(() {
                        opcaoSelecionada = newValue;
                      });
                    },
                    items: opcoes.map((opcao) {
                      return DropdownMenuItem(value: opcao, child: Text(opcao));
                    }).toList()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  controller: Quantidade_Informado,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("*Quantidade recebido"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  controller: Estoque_Minimo,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("*Estoque minimo"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  controller: Preco_De_Custo,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("*Preço de custo"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  controller: Outros_Custos,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("*Outros custos"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  controller: Margem_Custos,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '%Porcetagem%',
                    label: Text("*Margem"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  controller: Validade_Informado,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '00/00/0000',
                    label: Text("*Validade"),
                  ),
                ),
              ),
              SizedBox(
                width: 280,
                child: ElevatedButton(
                    onPressed: () {
                      if (_validacao.currentState!.validate()) {
                        DatabaseManager.insertProduto(Produtos(
                            descricao: Descricao.text,
                            unidadeDeMedida: opcaoSelecionada,
                            estoque: int.parse(Quantidade_Informado.text),
                            estoqueMinimo: int.parse(Estoque_Minimo.text),
                            precoDeCusto: double.parse(Preco_De_Custo.text),
                            outrosCustos: double.parse(Outros_Custos.text),
                            margem: double.parse(Margem_Custos.text),
                            validade: Validade_Informado.text));
                      }
                    },
                    child: const Text("Enviar")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
