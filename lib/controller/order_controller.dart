import 'dart:developer';

import 'package:abctechapp/model/assistance.dart';
import 'package:abctechapp/model/order.dart';
import 'package:abctechapp/model/order_created.dart';
import 'package:abctechapp/model/order_location.dart';
import 'package:abctechapp/services/geolocation_service.dart';
import 'package:abctechapp/services/order_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

enum OrderState {
  creating, 
  started, 
  finished
}
class OrderController extends GetxController with StateMixin<OrderCreated> {
  final GeolocationServiceInterface _geolocationService;
  final selectedAssistances = <Assistance>[].obs;
  final formKey = GlobalKey<FormState>();
  final operatorIdController = TextEditingController();
  final OrderServiceInterface _orderService;
  final screenState = OrderState.creating.obs;
  late Order _order;

  OrderController(this._geolocationService, this._orderService);

  @override
  void onInit() {
    super.onInit();
    _geolocationService.start();
  }

  Future<Position> getLocation() async {
    Position position = await _geolocationService.getPosition();

    return Future.sync(() => position);
  }

  OrderLocation orderLocationFromPosition(Position position) {
    return OrderLocation( 
            latitude: position.latitude,
            longitude: position.longitude,
            dateTime: DateTime.now()
          );
  }

  finishStartOrder() {

    switch(screenState.value) {
      case OrderState.creating: 
        getLocation().then((value) {
          _order = Order(operatorId: int.parse(operatorIdController.text), 
          services: [1,2], 
          start: orderLocationFromPosition(value), 
          end: null);
        });

        screenState.value = OrderState.started;

        break;
      case OrderState.started: 
        getLocation().then((value) {
           _order.end = orderLocationFromPosition(value);
           _createOrder();
        });

        break;
      case OrderState.finished:
     
        break;
    }
    getLocation();
  }

  _createOrder() {
    screenState.value = OrderState.finished;
    _orderService.createOrder(_order).then((value) {
      if(value.success) {
        Get.snackbar("Sucesso", "Ordem de serviço criada com sucesso.", backgroundColor: Colors.greenAccent);
      }
    }).catchError((onError) {
        Get.snackbar("Erro", onError.toString(), backgroundColor: Colors.redAccent);

    });
  }

  editServices() {
    Get.toNamed("/services", arguments: selectedAssistances);
  }
}