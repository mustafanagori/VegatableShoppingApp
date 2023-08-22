import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegitable/View/product_details.dart';
import 'package:vegitable/controller/counterController.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController c = Get.put(CounterController());
    List<String> vegitable = ['Potato', 'Onion', 'tomato', 'lady Finger'];

    RxList<int> price = [100, 230, 80, 80, 90].obs;
    List<String> img = [
      "https://t4.ftcdn.net/jpg/05/37/04/61/360_F_537046123_s8JVn2NrClPQDOryhSm8jonYZPfIzPRX.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9fD6nbgTnh64TnpFCh4gglq6rrgRVAqV4PLW4UkZuv5Ru7altAZ1qD-WuZQnor8BGGEU&usqp=CAU",
      "https://cdn.mos.cms.futurecdn.net/iC7HBvohbJqExqvbKcV3pP.jpg",
      "https://healthwire.pk/wp-content/uploads/2022/03/lady-finger-benefits.jpg",
    ];
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Vegatable"),
          actions: [
            Obx(
              () => Center(
                child: badges.Badge(
                  badgeContent: Text(
                    c.count.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  child: Icon(Icons.shopping_bag_outlined),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: vegitable.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(ProductDetails(
                        vegitable: vegitable[index],
                        price: price[index],
                        img: img[index],
                      ));
                    },
                    child: Card(
                        child: Row(
                      children: [
                        Image(
                            height: 100,
                            width: 100,
                            image: NetworkImage(img[index].toString())),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Name : ${vegitable[index].toString()}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Price  : " + price[index].toString(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                "Per KG ",
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
                          child: Container(
                            height: 35,
                            width: 100,
                            color: Colors.deepPurple,
                            child: Center(
                                child: Text(
                              "Add to Cart",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    )),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
