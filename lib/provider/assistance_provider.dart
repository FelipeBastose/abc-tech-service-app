import 'package:abctechapp/constants.dart';
import 'package:abctechapp/main.dart';
import 'package:get/get.dart';

abstract class AssistanceProviderInterface {
  Future<Response> getAssists(token);
}

class AssistanceProvider extends GetConnect implements AssistanceProviderInterface {
  @override
  Future<Response> getAssists(token) => get('${Constants.url}/assistance', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
  });
}