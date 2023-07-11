import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimercado/home/home.dart';

class Login_page_principal extends StatelessWidget {
  Login_page_principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.login),
                  text: "Login In",
                ),
                Tab(
                  icon: Icon(Icons.input),
                  text: "Longin Out",
                ),
              ]),
            ),
            body: TabBarView(
                children: [Login_componente(), LoginComponenteOut()]),
          )),
    );
  }
}

class Login_componente extends StatelessWidget {
  Login_componente({super.key});

  TextEditingController controler_name_login = TextEditingController();
  TextEditingController controler_password = TextEditingController();
  GlobalKey<FormState> keyItem = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyItem,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Informe o seu login",
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controler_name_login,
              validator: (value) {
                if (value == 'matheus@gmail.com') {
                  return "Confirma um E-mail valido";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Informe o E-mail")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controler_password,
              validator: (value) {
                if (value == '1234') {
                  return "Confirma uma Senha valida";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Informe a senha")),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (keyItem.currentState!.validate()) {
                  Get.to(Home_items());
                }
              },
              child: const Text("Acessar"))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginComponenteOut extends StatelessWidget {
  LoginComponenteOut({super.key});

  TextEditingController controler_name_login = TextEditingController();
  TextEditingController controler_password = TextEditingController();
  GlobalKey<FormState> keyItem = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyItem,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Confirma um E-mail valido";
                } else {
                  return null;
                }
              },
              controller: controler_name_login,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Informe o E-mail")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Confirma uma Senha valida";
                } else {
                  return null;
                }
              },
              controller: controler_password,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Informe a senha")),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Created Acess"))
        ],
      ),
    );
  }
}
