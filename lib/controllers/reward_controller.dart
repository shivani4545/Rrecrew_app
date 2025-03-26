// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../models/rewards_mdel.dart';
// import '../service/home_service.dart';
//
// class RewardsController extends GetxController {
//   TextEditingController searchController = TextEditingController();
//   @override
//   void onInit() {
//     getRewards();
//     super.onInit();
//   }
//
//   HomeService homeService = HomeService();
//   RxBool isLoading = false.obs;
//
//   final rewards = Rxn<RewarsModel>();
//
//   getRewards() async {
//     try {
//       isLoading.value = true;
//       rewards.value = await homeService.getUserRewards();
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//       // print(e);
//     }
//   }
// }
