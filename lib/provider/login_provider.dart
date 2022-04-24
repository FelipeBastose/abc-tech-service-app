import 'package:abctechapp/constants.dart';
import 'package:abctechapp/model/login.dart';
import 'package:get/get.dart';

abstract class LoginProviderInterface {
  Future<Response> postLogin(Login login);
}

class LoginProvider extends GetConnect implements LoginProviderInterface {
  @override
  Future<Response> postLogin(Login login) => post('${Constants.url}/auth', login.toMap());
}