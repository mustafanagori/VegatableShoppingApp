import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoint.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    try {
      var headers = {'content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoint.loginEmail);

      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences prefs = await _prefs;
          await prefs.setString('token', token);
          emailController.clear();
          passwordController.clear();
        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)['message'];
        } else {
          throw jsonDecode(response.body)['Message'] ?? "Unknow Error Occured";
        }
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Api Hit Error ",
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
