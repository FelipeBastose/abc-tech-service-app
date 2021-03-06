// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:abctechapp/model/order_location.dart';

class Order {
  int operatorId;
  List<int> services = [];
  Order({
    required this.operatorId,
    required this.services,
    required this.start,
    required this.end

  });
  OrderLocation? start;
  OrderLocation? end;


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'operatorId': operatorId,
      'services': services,
      'start': start?.toMap(),
      'end': end?.toMap()
    };
  }

  String toJson() => json.encode(toMap());
}
