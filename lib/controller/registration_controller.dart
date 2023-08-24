import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoint.dart';

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> registerWithEmail() async {
    try {
      print("fun run");
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoint.registerEmail);
      print(url);
      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };
      print(body);
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          //store after registration we get the token in token variable
          final SharedPreferences prefs = await _prefs;
          await prefs.setString('token', token);
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          // got to home
        } else {
          throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
        }
      } else {
        throw jsonDecode(response.body)['Message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
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
