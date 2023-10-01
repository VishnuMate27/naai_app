import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naai_app/view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Get.off(
        () => LoginView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          width: 260,
          height: 260,
          image: AssetImage('assets/images/NaaiLogo.png'),
        ),
      ),
    );
  }
}
