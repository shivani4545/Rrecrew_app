// import 'package:employee/models/branches_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../service/home_service.dart';
//
// class BranchesController extends GetxController {
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   void onInit() {
//     getBranches();
//     super.onInit();
//   }
//
//   HomeService homeService = HomeService();
//   RxBool isLoading = false.obs;
//
//   final branch = Rxn<BranchesModel>();
//
//   getBranches() async {
//     try {
//       isLoading.value = true;
//       branch.value = await homeService.getofficeBranches();
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//       // print(e);
//     }
//   }
// }
