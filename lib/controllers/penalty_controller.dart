// import 'package:employee/models/penalty_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../service/home_service.dart';
//
// class PenaltyController extends GetxController {
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   void onInit() {
//     getRewards();
//     super.onInit();
//   }
//
//   HomeService homeService = HomeService();
//   RxBool isLoading = false.obs;
//
//   final penalty = Rxn<PenltysModel>();
//
//   getRewards() async {
//     try {
//       isLoading.value = true;
//       penalty.value = await homeService.getuserPenltys();
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//       // print(e);
//     }
//   }
// }
