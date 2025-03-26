import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home/home_screen.dart';
import '../service/home_service.dart';

class FeedBackController extends GetxController {
  TextEditingController ans1Controller = TextEditingController();
  TextEditingController ans2Controller = TextEditingController();
  TextEditingController ans3Controller = TextEditingController();
  TextEditingController ans4Controller = TextEditingController();
  TextEditingController ans5Controller = TextEditingController();
  TextEditingController ans6Controller = TextEditingController();
  TextEditingController ans7Controller = TextEditingController();
  TextEditingController ans8Controller = TextEditingController();
  TextEditingController ans9Controller = TextEditingController();
  TextEditingController ans10Controller = TextEditingController();
  TextEditingController ans11Controller = TextEditingController();
  TextEditingController ans12Controller = TextEditingController();
  TextEditingController ans13Controller = TextEditingController();
  TextEditingController ans14Controller = TextEditingController();
  TextEditingController ans15Controller = TextEditingController();

  RxBool isLoading = false.obs;
  HomeService homeService = HomeService();
  RxBool isApplied = false.obs;

  sendFeedback() async {
    try {
      isLoading.value = true;
      isApplied.value = await homeService.addFeedback(
          ans1: ans1Controller.text,
          ans2: ans2Controller.text,
          ans3: ans3Controller.text,
          ans4: ans4Controller.text,
          ans5: ans5Controller.text,
          ans6: ans6Controller.text,
          ans7: ans7Controller.text,
          ans8: ans8Controller.text,
          ans9: ans9Controller.text,
          ans10: ans10Controller.text,
          ans11: ans11Controller.text,
          ans12: ans12Controller.text,
          ans13: ans13Controller.text,
          ans14: ans14Controller.text,
          ans15: ans15Controller.text);
      if (isApplied.value == true) {
        Get.off(() => HomeScreen());
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }
}
