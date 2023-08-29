import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/order_model.dart';

class OrderController extends GetxController {
  List<OrderModel> orders = []; // List to hold orders
  double totalPrice = 0.0;
  int count = 1;
  // void inc(value) {
  //   count++;
  // }

  // void dec(value) {
  //   if (count > 1) {
  //     count--;
  //   }
  // }
  void inc(int index) {
    orders[index].count++;
    print("Product ${orders[index].title}");
    print("Product ${orders[index].count}");
    print("Product ${orders[index].id}");

    update();
  }

  void dec(int index) {
    if (orders[index].count > 1) {
      orders[index].count--;
      print("title ${orders[index].title}");
      print("quntity ${orders[index].count}");
      print("id ${orders[index].id}");

      update();
    }
  }

  Future<void> getdata() async {
    try {
      // var headers = {'content-Type': 'application/json'};
      var url = Uri.parse("https://productapi.vcapture.pk/public/api/products");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        final List<OrderModel> ordersList =
            data.map((product) => OrderModel.fromJson(product)).toList();
        orders = ordersList;
      } else {
        Get.snackbar("Error", "Request faild ${response.statusCode}");
      }
      update();
    } catch (e) {
      Get.defaultDialog(
        title: "Unable ",
        content: Column(
          children: [
            Text(e.toString()),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("ok")),
            )
          ],
        ),
      );
    }
  }
}
