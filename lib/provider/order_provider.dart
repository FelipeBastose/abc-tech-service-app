import 'package:abctechapp/constants.dart';
import 'package:abctechapp/main.dart';
import 'package:abctechapp/model/order.dart';
import 'package:get/get.dart';

abstract class OrderProviderInterface {
  Future<Response> postOrder(Order order, token);
}

class OrderProvider extends GetConnect implements OrderProviderInterface {
  @override
  Future<Response> postOrder(Order order, token) => post('${Constants.url}/order', order.toMap(), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token}',
  });
}