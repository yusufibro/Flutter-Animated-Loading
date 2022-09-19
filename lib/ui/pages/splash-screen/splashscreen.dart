import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:loadingscreen/ui/pages/home/home_page.dart';
import 'package:lottie/lottie.dart';

import '../../themes/colors.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });

    animationController.repeat();
    // Timer(const Duration(seconds: 6), () {
    //   // Get.off(OnBoardingPage());
    //   Get.to(HomePage());

    //   // isi tujuan seabis splashscreen
    // });
  }

  @override
  Widget build(BuildContext context) {
    final percentage = animationController.value * 100;
    return Scaffold(
      // isi splash screen
      backgroundColor: ThemeColors.kPColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'res/images/cats.json',
            width: 200,
          ),
          Container(
            width: Get.width,
            height: 85,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: LiquidLinearProgressIndicator(
              value: animationController.value, // Defaults to 0.5.
              valueColor: AlwaysStoppedAnimation(ThemeColors
                  .kPColor), // Defaults to the current Theme's accentColor.
              backgroundColor: Colors.grey[
                  300], // Defaults to the current Theme's backgroundColor.
              borderColor: Colors.white,
              borderWidth: 5.0,
              direction: Axis
                  .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
              center: Text(
                "${percentage.toStringAsFixed(0)}%",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
