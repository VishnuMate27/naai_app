import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naai_app/view/booking_view.dart';
import 'package:naai_app/view/confirmation_view.dart';
import 'package:naai_app/view/dashboard_view.dart';
import 'package:naai_app/view/employee_view.dart';
import 'package:naai_app/view/login_view.dart';
import 'package:naai_app/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'NAAI Assignment',
        home: SplashView(),
      ),
    );
  }
}

