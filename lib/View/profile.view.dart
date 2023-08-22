import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("My Profile"),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: h * 0.03),
              //profile
              const CircleAvatar(
                maxRadius: 70,
                minRadius: 30,
                backgroundImage: NetworkImage(
                    "https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/social-media-profile-photos-3.jpg"),
              ),
              SizedBox(height: h * 0.03),
              //name
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Full Name : ",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Ghulam Mustafa",
                      style: TextStyle(color: Colors.black38, fontSize: 20),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                            title: "Enter Name",
                            titleStyle:
                                TextStyle(color: Colors.black45, fontSize: 20),
                            content: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: TextFormField(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("Close")),
                                    SizedBox(
                                      width: w * 0.07,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                          Get.snackbar(
                                              "updated", "Name updated");
                                        },
                                        child: Text("Update"))
                                  ],
                                )
                              ],
                            ));
                      },
                      icon: const Icon(
                        CupertinoIcons.pencil,
                        size: 25,
                        color: Colors.black54,
                      )),
                ],
              ),
              const Divider(),
              // contact
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      " Contact : ",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "03401208100",
                      style: TextStyle(color: Colors.black38, fontSize: 20),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                            title: "Enter Contact",
                            titleStyle:
                                TextStyle(color: Colors.black45, fontSize: 20),
                            content: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: TextFormField(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("Close")),
                                    SizedBox(
                                      width: w * 0.07,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                          Get.snackbar(
                                              "Update", "Contact updated");
                                        },
                                        child: Text("Update"))
                                  ],
                                )
                              ],
                            ));
                      },
                      icon: const Icon(
                        CupertinoIcons.pencil,
                        size: 25,
                        color: Colors.black54,
                      ))
                ],
              ),
              const Divider(),
              // address
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Address : ",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          "plot 356  selctor 13  malir halt karachi",
                          style: TextStyle(color: Colors.black38, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  //  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                            title: "Enter New Address",
                            titleStyle:
                                TextStyle(color: Colors.black45, fontSize: 20),
                            content: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: TextFormField(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("Close")),
                                    SizedBox(
                                      width: w * 0.07,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                          Get.snackbar(
                                              "updated", "Address updated");
                                        },
                                        child: Text("Update"))
                                  ],
                                )
                              ],
                            ));
                      },
                      icon: const Icon(
                        CupertinoIcons.pencil,
                        size: 25,
                        color: Colors.black54,
                      ))
                ],
              ),
              const Divider(),

              // Gender
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Gender: ",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Male",
                      style: TextStyle(color: Colors.black38, fontSize: 20),
                    ),
                  ),
                ],
              ),
              const Divider(),

              // button
              SizedBox(height: h * 0.15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: h * 0.06,
                  width: w * 0.3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        Get.snackbar("sucessfully", "Logout");
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
