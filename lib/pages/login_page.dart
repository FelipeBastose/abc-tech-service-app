
import 'package:abctechapp/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40
        ),
        child: Form(
          key: controller.formKey,
            child: ListView(
            children: <Widget> [
              const Text("MBA - Engenharia de Software Fiap", textAlign: TextAlign.center),
              TextFormField(
                controller: controller.usuario,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Usuário",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.senha,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                  )
                ),
                
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () => controller.login(),
                          child: const Text("Entrar")))
                ]),
            ],
          ),
        )
      ),
    );
  }
}
