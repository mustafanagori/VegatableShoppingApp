import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/order_controller.dart';

class OrderView extends StatefulWidget {
  OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         orderController.getdata();
          //       },
          //       icon: const Icon(Icons.refresh))
          // ],
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Order Details"),
        ),
        body: Column(
          children: [
            GetBuilder<OrderController>(
              builder: (controller) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: orderController.orders.length,
                      itemBuilder: (context, index) {
                        final order = controller.orders[index];
                        final Uint8List decodedImage = base64Decode(order.img!);
                        return ListTile(
                          leading: SizedBox(
                            width: 70,
                            height: 70,
                            child: Image.memory(
                              decodedImage, // Provide the Uint8List directly
                              fit: BoxFit
                                  .cover, // Adjust the fit property as needed
                            ),
                          ),
                          title: Text('Title : ${order.title}'),
                          subtitle: Text('Des: ${order.description}'
                              'Price: ${order.price.toString()}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  orderController.dec(index);
                                },
                                icon: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red.shade500,
                                ),
                              ),
                              Text(order.count.toString()),
                              IconButton(
                                onPressed: () {
                                  orderController.inc(index);
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.green.shade500,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              },
            ),
            //
            Spacer(),
            Container(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width,
                color: Colors.black54,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Total Amount :",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "9020/-",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            Get.snackbar("Sucessfully", "Order has been place");
                          },
                          child: const Text(
                            "Order!",
                            style: TextStyle(fontSize: 18),
                          )),
                    )
                  ],
                )),
          ],
        ));
  }
}
