import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:naai_app/res/Utils/utils.dart';
import 'package:naai_app/view/dashboard_view.dart';

class LoginViewModel extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginApi() async {
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://reqres.in/api/login'));
    request.body = json.encode(data);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Get.to(DashboardView());
      Utils.toastMessage('Login Succeseful');
      print(await response.stream.bytesToString());
    }
    else {
      Utils.toastMessage(response.reasonPhrase.toString());
      //Utils.snackBar('Login', 'Use email: eve.holt@reqres.in\n Use password: cityslicka');
    }
  }

}