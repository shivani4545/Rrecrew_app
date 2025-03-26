// import 'package:employee/models/department_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../service/home_service.dart';
//
// class DepartmentController extends GetxController {
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   void onInit() {
//     getDept();
//     super.onInit();
//   }
//
//   HomeService homeService = HomeService();
//   RxBool isLoading = false.obs;
//
//   final department = Rxn<DepartmentModel>();
//
//   getDept() async {
//     try {
//       isLoading.value = true;
//       department.value = await homeService.getDeapartments();
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//       // print(e);
//     }
//   }
// }
