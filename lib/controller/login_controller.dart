
import 'package:abctechapp/main.dart';
import 'package:abctechapp/model/login.dart';
import 'package:abctechapp/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';


class LoginController extends GetxController with StateMixin<List<Login>> {
  final formKey = GlobalKey<FormState>();
  final usuario = TextEditingController();
  final senha = TextEditingController();
  final LoginServiceInterface _loginService;
  late Login _login;

  LoginController(this._loginService);

  @override
  void onInit() {
    super.onInit();
  }

  login() {
    _login = Login(
      usuario: usuario.text,
      senha: senha.text
    );

    _loginService.login(_login).then((value) {
      if(value.success) {
        Get.toNamed("/order_page");
      }
    }).catchError((onError) {
      Get.snackbar("Erro", onError.toString(), backgroundColor: Colors.redAccent);
    });
  }
}
