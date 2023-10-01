import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DashboardViewModel extends GetxController {
  List items = [];
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data/employee.json');
    final data = await json.decode(response);
      items = data["data"];
      print("..number of items ${items.length}");
      update();
  }

}
