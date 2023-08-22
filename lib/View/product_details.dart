// import 'package:badges/badges.dart' as badges;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vegitable/View/navigation.dart';

// import '../controller/card_controller.dart';
// import '../controller/counterController.dart';

// class ProductDetails extends StatefulWidget {
//   final String vegitable;
//   final int? price;
//   final String img;

//   const ProductDetails({
//     required this.vegitable,
//     required this.price,
//     required this.img,
//   });

//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails> {
//   CounterController c = Get.put(CounterController());
//   final CartController cartController = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Obx(
//             () => Center(
//               child: badges.Badge(
//                 badgeContent: Text(
//                   c.count.toString(),
//                   style: TextStyle(color: Colors.white, fontSize: 12),
//                 ),
//                 child: Icon(
//                   Icons.shopping_bag_outlined,
//                   size: 28,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//         ],
//         centerTitle: true,
//         title: const Text("Order Details"),
//         leading: IconButton(
//             onPressed: () {
//               Get.to(Navigation());
//               c.reset();
//             },
//             icon: Icon(Icons.arrow_back)),
//       ),
//       body: Column(
//         children: [
//           Card(
//               child: Row(
//             children: [
//               Image(
//                   height: 80,
//                   width: 80,
//                   image: NetworkImage(widget.img.toString())),
//               const SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Name :  ${widget.vegitable}",
//                       style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black45),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "Price:  ${widget.price}",
//                       style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black45),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     const Text(
//                       "Per KG",
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black38),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Container(
//                   height: 35,
//                   width: 115,
//                   decoration: BoxDecoration(
//                     color: Colors.black12,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Obx(
//                     () => Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             c.dec(1);
//                           },
//                           icon: Icon(
//                             Icons.remove_circle,
//                             color: Colors.red.shade500,
//                           ),
//                         ),
//                         Text(c.count.toString()),
//                         IconButton(
//                           onPressed: () {
//                             c.inc(1);
//                           },
//                           icon: Icon(
//                             Icons.add_circle,
//                             color: Colors.green.shade500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//           Spacer(),
//           Container(
//               height: 50,
//               width: double.infinity,
//               color: Colors.black12,
//               child: Obx(
//                 () => Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Total Amount: ",
//                           style: TextStyle(
//                               color: Colors.black45,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18),
//                         ),
//                         Text(
//                           "${widget.price! * c.count.toInt()}/-",
//                           style: const TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       "Qty : ${c.count} ",
//                       style: const TextStyle(
//                           color: Colors.deepOrange,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
