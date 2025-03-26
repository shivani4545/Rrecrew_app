import 'package:employee/screens/auth/loginscreen.dart';
import 'package:employee/screens/home/home_screen.dart';
import 'package:employee/service/auth_service.dart';
import 'package:employee/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:camera/camera.dart';


class LoginController extends GetxController {
  @override
  void onInit() async {
    await checkLoginOrNot();
    firebaseApi.initialzeNotification();
    super.onInit();
  }

  late List<CameraDescription> cameras;

  setCameras(List<CameraDescription> cam){
    cameras = cam;
  }

  FirebaseApi firebaseApi = FirebaseApi();
  AuthService authService = AuthService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool login = false.obs;

  checkLoginOrNot() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isLoggedIn = prefs.getBool('isLoggedIn');
      isLoggedIn == true
          ? Get.offAll(() => HomeScreen())
          : Get.to(() => const LoginScreen());
    } catch (e) {
      // print(e);
    }
  }

  Future loginUser({
    required String emial,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      login = await authService.loginUser(emial, password);
      if (login.value == true) {
        Get.offAll(() => HomeScreen());
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}
