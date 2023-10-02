import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:nogod/pages/loging_page.dart';
import 'package:nogod/static/all_colors.dart';
import 'package:nogod/static/all_texts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Future welcome() async {
    Future.delayed(const Duration(seconds: 5)).then((value) => Get.to(LogingPage()));
  }

  @override
  void initState() {
    welcome();
    super.initState();
  }

  List<Color> lodingColor = [
    AllColor.whiteColor,
   AllColor.white70Color,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColor.orangeColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              Image.asset("assets/images/nogod_logo.png"),
              AllText.nagadText,
              SizedBox(
                height: 1000,
                width: 200,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  strokeWidth: 0.1,
                  colors: lodingColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
