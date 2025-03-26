import 'dart:async';

import 'package:camera/camera.dart';

import 'package:employee/controllers/face_recognization/face_values_controller.dart';
import 'package:employee/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/login_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key, required this.cameras});

  List<CameraDescription> cameras;

  splashScreenTimer(){
    Timer(Duration(seconds: 1) , (){
      //Called After GetMaterial app is Created
      var loginControl = Get.put(LoginController());
      loginControl.setCameras(cameras);
    });
  }

  @override
  Widget build(BuildContext context) {
    splashScreenTimer();

    return const Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: Center(
        child: Image(
          image: AssetImage("assets/images/logo.png"),
        ),
      ),
    );
  }
}
