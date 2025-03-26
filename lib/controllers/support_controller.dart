// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../models/department_model.dart';
// import '../screens/home/home_screen.dart';
// import '../service/home_service.dart';
//
// class SupportController extends GetxController {
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController messageController = TextEditingController();
//   TextEditingController departmentController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//
//   HomeService homeService = HomeService();
//   RxBool isLoading = false.obs;
//   RxBool isContact = false.obs;
//   RxString departMent = "".obs;
//   final formkey = GlobalKey<FormState>();
//
//   @override
//   void onInit() {
//     getDept();
//     super.onInit();
//   }
//
//   conatctUs() async {
//     try {
//       isLoading.value = true;
//       isContact.value = await homeService.support(
//           problem: messageController.text,
//           email: emailController.text,
//           phoneno: mobileController.text,
//           description: descriptionController.text,
//           department: departMent.value.toString());
//       if (isContact.value == true) {
//         Get.off(() => HomeScreen());
//       }
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//       // print(e);
//     }
//   }
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
