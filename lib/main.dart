import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/others/wellcome.dart';
import 'controller/order_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.find<OrderController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //getPages: [],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const WellcomeScreen(),
    );
  }
}
