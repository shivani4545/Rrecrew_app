import 'dart:math';
import 'package:camera/camera.dart';
import 'package:employee/controllers/face_recognization/face_values_controller.dart';
import 'package:employee/models/latland_model.dart';
import 'package:employee/screens/recognization/face_verification_screen.dart';
import 'package:employee/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_model.dart';
import '../service/home_service.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getuserOfficeLocation();
    getuserDetails(isLoder: true);
    greeting();
    super.onInit();
  }
  RxString userName = "".obs;
  RxString greetingName = "".obs;
  RxString lat = "".obs;
  RxString lang = "".obs;
  RxBool isLoading = false.obs;
  RxBool ischeckLoading = false.obs;
  RxBool ischeckLoading2 = false.obs;
  Location location = Location();
  HomeService homeService = HomeService();
  RxBool? isclockin;
  RxBool? isclockout;

  double distance = 0;

  Future<void> chekin(List<CameraDescription> cameras, FaceValuesController faceValueController, HomeController homeController) async {
    try {
      ischeckLoading.value = true;
      final hasPermission = await homeService.handleLocationPermission();
      if (!hasPermission) {
        ischeckLoading.value = false;
        return;
      }
      await getuserOfficeLocation();
      Position? position = await Geolocator.getCurrentPosition();
      // print("Testing ; " + position.toString() + " : " +officelocation.value!.lat.toString());

      //Original
      distance = _calculateDistance(
          lat1: double.parse(officelocation.value!.lat.toString()),
          lat2: position.latitude.toDouble(),
          lon1: double.parse(officelocation.value!.lang ?? "00"),
          lon2: position.longitude.toDouble());

      if (distance <= 75) {
        Get.to(FaceVerificationScreen(type: "1" ,cameras: cameras, searchUserId: "", faceValuesController: faceValueController, homeController: homeController));

      } else {
        Get.snackbar("Please move closer to the office premises to be able to login", "",
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        ischeckLoading.value = false;
      }
    } catch (e) {
      Get.snackbar("Something Went Wrong..Try Again", "",
          backgroundColor: MyColors.blackColor, colorText: MyColors.whiteColor);
      ischeckLoading.value = false;
    }finally{
      ischeckLoading.value = false;
    }
  }

  void checkout(List<CameraDescription> cameras, FaceValuesController faceValueController, HomeController homeController) async {
    try {
      ischeckLoading2.value = true;
      final hasPermission = await homeService.handleLocationPermission();
      if (!hasPermission) {
        ischeckLoading.value = false;
        return;
      }

      await getuserOfficeLocation();
      Position? position = await Geolocator.getCurrentPosition();
      distance = _calculateDistance(
          lat1: double.parse(officelocation.value!.lat.toString()),
          lat2: position.latitude.toDouble(),
          lon1: double.parse(officelocation.value!.lang ?? "00"),
          lon2: position.longitude.toDouble());

      if (distance <= 50) {
        Get.to(FaceVerificationScreen(type: "2", cameras: cameras, searchUserId: "", faceValuesController: faceValueController, homeController: homeController));

      } else {
        Get.snackbar("Please move closer to the office premises to be able to logout", "",
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        ischeckLoading2.value = false;
      }
    } catch (e) {
      Get.snackbar("Something Went Wrong..Try Again", "",
          backgroundColor: MyColors.blackColor, colorText: MyColors.whiteColor);
      ischeckLoading2.value = false;
      // print(e);
    }finally{
      ischeckLoading2.value = false;
    }
  }

  Future<void> clockInAfterVerification(BuildContext context, String type, String imagePath) async {
    try {
      if(type == "1"){
        ischeckLoading.value = true;
      }else{
        ischeckLoading2.value = true;
      }

      // Get user ID from SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId') ?? '';


      await homeService.clockIn(type: type, userId: userId, imagePath: imagePath);

      await getuserDetails(isLoder: false);

      if(type == "1"){
        ischeckLoading.value = true;
      }else{
        ischeckLoading2.value = true;
      }

    } catch (e) {
      Get.snackbar("Something Went Wrong..Try Again", "",
          backgroundColor: MyColors.blackColor, colorText: MyColors.whiteColor);

      if(type == "1"){
        ischeckLoading.value = true;
      }else{
        ischeckLoading2.value = true;
      }
    }finally{
      // Navigator.pop(context);
    }
  }




  // Regular CheckIn Without Face Recognization
  // CheckInOut & Selfie Code
  Future<void> regularChekin() async {
    try {
      ischeckLoading.value = true;
      final hasPermission = await homeService.handleLocationPermission();
      if (!hasPermission) {
        ischeckLoading.value = false;
        return;
      }
      await getuserOfficeLocation();
      Position? position = await Geolocator.getCurrentPosition();

      //Original
      distance = _calculateDistance(
          lat1: double.parse(officelocation.value!.lat.toString()),
          lat2: position.latitude.toDouble(),
          lon1: double.parse(officelocation.value!.lang ?? "00"),
          lon2: position.longitude.toDouble());

      if (distance <= 75) {
        await homeService.takePictureAndUpload("1");
        await getuserDetails(isLoder: false);
        ischeckLoading.value = false;

      } else {
        Get.snackbar("Please move closer to the office premises to be able to login", "",
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        ischeckLoading.value = false;
      }
    } catch (e) {
      // print("Testing Error ; " + e.toString());
      Get.snackbar("Something Went Wrong..Try Again", "",
          backgroundColor: MyColors.blackColor, colorText: MyColors.whiteColor);
      ischeckLoading.value = false;
    }
  }

  void regularCheckout() async {
    try {
      ischeckLoading2.value = true;
      final hasPermission = await homeService.handleLocationPermission();
      if (!hasPermission) {
        ischeckLoading.value = false;
        return;
      }

      await getuserOfficeLocation();
      Position? position = await Geolocator.getCurrentPosition();
      distance = _calculateDistance(
          lat1: double.parse(officelocation.value!.lat.toString()),
          lat2: position.latitude.toDouble(),
          lon1: double.parse(officelocation.value!.lang ?? "00"),
          lon2: position.longitude.toDouble());

      if (distance <= 50) {

        await homeService.takePictureAndUpload("2");
        await getuserDetails(isLoder: false);
        ischeckLoading2.value = false;

      } else {
        Get.snackbar("Please move closer to the office premises to be able to logout", "",
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        ischeckLoading2.value = false;
      }
    } catch (e) {
      Get.snackbar("Something Went Wrong..Try Again", "",
          backgroundColor: MyColors.blackColor, colorText: MyColors.whiteColor);
      ischeckLoading2.value = false;
      // print(e);
    }
  }

  greeting() {
    try {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        greetingName.value = 'Good Morning';
      } else if (hour < 17) {
        greetingName.value = 'Good Afternoon';
      } else {
        greetingName.value = 'Good Evening';
      }
      return "";
    } catch (e) {
      // print(e);
    }
  }

  double _calculateDistance(
      {required lat1,
        required double lon1,
        required double lat2,
        required double lon2}) {
    const int earthRadius = 6371000;
    double dLat = (lat2 - lat1) * (3.141592653589793 / 180);
    double dLon = (lon2 - lon1) * (3.141592653589793 / 180);
    double a = pow(sin(dLat / 2), 2) +
        cos(lat1 * (3.141592653589793 / 180)) *
            cos(lat2 * (3.141592653589793 / 180)) *
            pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;
    return distance;
  }

  final user = Rxn<Profile>();
  final officelocation = Rxn<LatLangModel>();
  getuserDetails({required bool isLoder}) async {
    try {
      if (isLoder == true) {
        isLoading.value = true;
        user.value = await homeService.getUserProfile();
        isLoading.value = false;
      } else {
        user.value = await homeService.getUserProfile();
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  getuserOfficeLocation() async {
    try {
      officelocation.value = await homeService.getoffcelocation();
    } catch (e) {
      //
    }
  }


  bool? faceRecognization;

  fetchFaceRecognizationValues() async {
    faceRecognization = await homeService.fetchFaceRecognization();
  }

  setFaceRecognizationValues(bool setPref) async {
    bool temp = await homeService.setFaceRecognizationValue(setPref);
    if(temp == true){
      faceRecognization = setPref;
    }else{
      faceRecognization = false;
      Get.snackbar("Something Went Wrong..Try Again Later...", "",
          backgroundColor: MyColors.blackColor, colorText: MyColors.whiteColor);
    }
  }

}
