import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/card_controller.dart';
import 'navigation.dart';

class ShoppingCartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    //final List<Product> cartProducts = cartController.cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: GetBuilder<CartController>(
          init: cartController,
          builder: (controller) {
            if (cartController.cart.isEmpty) {
              return const Center(
                child: Text('Your cart is empty.'),
              );
            } else {
              return ListView.builder(
                itemCount: cartController.cart.length,
                itemBuilder: (context, index) {
                  final product = cartController.cart[index];
                  return Card(
                      child: Row(
                    children: [
                      Image(
                        height: 80,
                        width: 80,
                        image: NetworkImage(product.img.toString()),
                        errorBuilder: (context, error, stackTrace) {
                          print('Error loading image: $error');
                          return const Icon(Icons
                              .error); // Show an error icon or placeholder image
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name :  ${product.name.toString()}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Price:  ${product.price.toString()}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Per KG",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 115,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                cartController.dec(product);
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.red.shade500,
                              ),
                            ),
                            // Obx(
                            //   () => Text(product.quantity.toString()),
                            // ),
                            Text(product.quantity.toString()),
                            IconButton(
                              onPressed: () {
                                cartController.inc(product);
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.green.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cartController.removeFromCart(product.id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ));
                },
              );
            }
          }),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Obx(
                () => Text(
                  'Total: ${cartController.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Color.fromARGB(255, 34, 124, 37)),
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Are you sure ? ",
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () {
                                  cartController.clearCart();
                                  Get.to(Navigation());
                                  Get.snackbar(
                                      "Order !", "Order has been place");
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                        titleStyle: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold));
                  },
                  child: const Text(
                    "Order Now !",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          )),
    );
  }
}
