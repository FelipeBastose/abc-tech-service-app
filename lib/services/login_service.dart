import 'package:abctechapp/main.dart';
import 'package:abctechapp/model/login.dart';
import 'package:abctechapp/model/login_success.dart';
import 'package:abctechapp/provider/login_provider.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

abstract class LoginServiceInterface {
  Future<LoginSuccess> login(Login login);

}

class LoginService extends GetxService implements LoginServiceInterface {

  final LoginProviderInterface _loginProvider;

  LoginService(this._loginProvider);

  @override
  Future<LoginSuccess> login(Login login) async {
    Response response = await _loginProvider.postLogin(login);

    if(response.statusCode != 200) {
      return Future.error(ErrorDescription("Usuário ou senha inválido!"));
    }

    try {
      await storage.write(key: "jwt", value: response.body['token']);

      return Future.sync(() => LoginSuccess(success: true, message: ''));
    } catch (e) {
      e.printError();
      return Future.error(ErrorDescription("Erro não esperado"));
    }


  }

}