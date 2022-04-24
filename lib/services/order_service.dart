import 'package:abctechapp/main.dart';
import 'package:abctechapp/model/order.dart';
import 'package:abctechapp/model/order_created.dart';
import 'package:abctechapp/provider/order_provider.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

abstract class OrderServiceInterface {
  Future<OrderCreated> createOrder(Order order);

}

class OrderService extends GetxService implements OrderServiceInterface {

  final OrderProviderInterface _orderProvider;

  OrderService(this._orderProvider);

  @override
  Future<OrderCreated> createOrder(Order order) async {
    var token = await storage.read(key: "jwt");
    Response response = await _orderProvider.postOrder(order, token);

    if(response.hasError) {
      //TODO tratar possiveis cenarios de errro da api
      return Future.error(ErrorDescription("Erro na api."));
    }

    try {
      return Future.sync(() => OrderCreated(success: true, message: ''));
    } catch (e) {
      e.printError();
      return Future.error(ErrorDescription("Erro não esperado"));
    }


  }

}