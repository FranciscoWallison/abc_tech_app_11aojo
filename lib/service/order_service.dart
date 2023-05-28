import 'package:abc_tech_app/model/order.dart';
import 'package:abc_tech_app/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

abstract class OrderServiceInterface {
  Future<bool> createOrder(Order order);
}

class OrderService extends GetxService implements OrderServiceInterface {
  final OrderProviderInterface _orderProvider;
  OrderService(this._orderProvider);

  @override
  Future<bool> createOrder(Order order) async {
    try {
      log("TESTE createOrder: ${order.toString()}");
      Response response = await _orderProvider.postOrder(order);
      log("TESTE createOrder response: ${response.toString()}");
      if (response.hasError) {
        return Future.error(ErrorDescription("Erro na conexão"));
      }
      return Future.sync(() => true);
    } catch (e) {
      e.printInfo();
      log("TESTE createOrder catch: ${e.toString()}");
      return Future.error(ErrorDescription("Erro não esperado"));
    }
  }
}
