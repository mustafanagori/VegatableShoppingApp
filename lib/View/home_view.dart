import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegitable/View/shopping_card.dart';

import '../controller/card_controller.dart';
import '../model/product_model.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CartController cartController = Get.put(CartController());

  List<String> vegitable = [
    'Potato',
    'Onion',
    'Tomato',
    'Lady Finger',
    "garlic",
    "carrot",
    "peas",
  ];

  List<int> price = [100, 230, 80, 180, 90, 120, 60];

  List<String> img = [
    "https://t4.ftcdn.net/jpg/05/37/04/61/360_F_537046123_s8JVn2NrClPQDOryhSm8jonYZPfIzPRX.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9fD6nbgTnh64TnpFCh4gglq6rrgRVAqV4PLW4UkZuv5Ru7altAZ1qD-WuZQnor8BGGEU&usqp=CAU",
    "https://cdn.mos.cms.futurecdn.net/iC7HBvohbJqExqvbKcV3pP.jpg",
    "https://healthwire.pk/wp-content/uploads/2022/03/lady-finger-benefits.jpg",
    "https://cdn-prod.medicalnewstoday.com/content/images/articles/265/265853/bulbs-and-bowl-of-garlic.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPuxJEcREPW2ZboG7j33jOflJ3sa-FYj9-_g&usqp=CAU",
    "https://m.media-amazon.com/images/I/61NM5XRLbSL.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final List<Product> cartProducts = cartController.cart;
    final List<Product> products = List.generate(vegitable.length, (index) {
      return Product(
        id: UniqueKey().hashCode,
        name: vegitable[index],
        price: price[index].toDouble(),
        img: img[index],
      );
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Vegetable"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: vegitable.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Image(
                        height: 100,
                        width: 100,
                        image: NetworkImage(img[index]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Name: ${vegitable[index]}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Price: \$${price[index]}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              "Per KG",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black26),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            final productIndex = index;
                            final product = products[productIndex];

                            if (cartController.cart.isEmpty ||
                                !cartController.cart
                                    .any((p) => p.id == product.id)) {
                              cartController.addToCart(product);
                              Get.snackbar(
                                'Added to Cart',
                                'Product added to the cart.',
                              );
                            } else {
                              Get.snackbar(
                                'Already Added',
                                'This product is already in the cart.',
                              );
                            }
                          },
                          child: const Text('Add to Cart'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Get.to(ShoppingCartScreen());
        },
        child: Obx(
          () => Center(
            child: badges.Badge(
              badgeContent: Text(
                cartController.cart.length.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              child: const Icon(Icons.shopping_cart),
            ),
          ),
        ),
      ),
    );
  }
}
