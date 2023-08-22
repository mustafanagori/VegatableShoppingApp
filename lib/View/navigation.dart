import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegitable/View/home_view.dart';
import 'package:vegitable/View/order_view.dart';
import 'package:vegitable/View/profile.view.dart';

import '../controller/navigation.dart';

class Navigation extends StatelessWidget {
  Navigation({super.key});

  HomeNavigation bottomNavigationContoller = Get.put(HomeNavigation());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access the current theme

    return Obx(
      () => Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: IndexedStack(
            index: bottomNavigationContoller.selectedIndex.value,
            children: [
              HomeView(),
              OrderView(),
              ProfileView(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: theme
                .colorScheme.primary, // Use the primary color from the theme
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(10),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            currentIndex: bottomNavigationContoller.selectedIndex.value,
            onTap: bottomNavigationContoller.changeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_sharp),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart),
                label: "Order",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
