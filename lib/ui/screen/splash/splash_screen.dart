import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/ui/screen/splash/logic/splash_controller.dart';
import 'package:movies_app/ui/utils/responsive.dart';

import '../../utils/constants/constants.dart';



class SplashScreen extends GetWidget<SplashController> {
  SplashScreen({Key? key}) : super(key: key);
  final splashController = Get.find<SplashController>();
  
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: kDimens5.toInt()),(){
      Get.offNamed(kHome);
    });
    return Scaffold(
      body: SizedBox(
        width: Responsive.of(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [ 
            Lottie.asset(
              'assets/movie_animation.json',
              height: Responsive.of(context).hp(kDimens40),
              width: Responsive.of(context).wp(kDimens80)
            )
          ],
        ),
      ),
    );
  }
}