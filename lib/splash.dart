import 'dart:async';

import 'package:bookworm/core/assets/assets.dart';
import 'package:bookworm/features/home/controller/home_controller.dart';
import 'package:bookworm/features/home/views/bottom_navigation_bar.dart';
import 'package:bookworm/features/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late HomeController homeController;

  @override
  void initState() {
    homeController = Get.put(HomeController());
    navigateToHome();
    super.initState();
  }

  /// Navigating to Home after 4 seconds
  void navigateToHome() {
    Timer(
      const Duration(milliseconds: 4000),
      () => Get.off(() => HomeNavigationBar(), transition: Transition.fadeIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.3,
            ),
            Lottie.asset(AppAssets.splashAnim),
          ],
        ),
      ),
    );
  }
}
