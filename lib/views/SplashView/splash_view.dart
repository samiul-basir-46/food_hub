import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/route_names.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      final box = GetStorage();
      bool isFirstTime = box.read('isFirstTime') ?? true;

      if (isFirstTime) {
        Get.offNamed(RouteNames.onBoard);
      } else {
        Get.offNamed(RouteNames.home);
      }
    });
    return Scaffold(
      body: Center(child: Image.asset('assets/images/splash_pic.png')),
    );
  }
}
