// import 'dart:io';
// import 'package:employee/models/jobs_model.dart';
// import 'package:employee/screens/home/home_screen.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../service/home_service.dart';
//
// class JobsController extends GetxController {
//   TextEditingController searchController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController refrenceController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController resumeController = TextEditingController();
//
//   final formkey = GlobalKey<FormState>();
//   File? resume;
//   @override
//   void onInit() {
//     getJobss();
//     super.onInit();
//   }
//
//   HomeService homeService = HomeService();
//   RxBool isLoading = false.obs;
//   RxList<Jobs> jobs = <Jobs>[].obs;
//   RxList<Jobs> jobs2 = <Jobs>[].obs;
//   getJobss() async {
//     try {
//       isLoading.value = true;
//       jobs.value = await homeService.getJobs();
//       jobs2.value = jobs;
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//     }
//   }
//
//   Future<void> serchJob({required String query}) async {
//     try {
//       if (query.isNotEmpty) {
//         jobs = jobs2
//             .where((item) =>
//                 item.salaryFrom
//                     .toString()
//                     .toLowerCase()
//                     .contains(query.toLowerCase()) ||
//                 item.title
//                     .toString()
//                     .toLowerCase()
//                     .contains(query.toLowerCase()) ||
//                 item.location
//                     .toString()
//                     .toLowerCase()
//                     .contains(query.toLowerCase()) ||
//                 item.noOfVacancies
//                     .toString()
//                     .toLowerCase()
//                     .contains(query.toLowerCase()) ||
//                 item.experience
//                     .toString()
//                     .toLowerCase()
//                     .contains(query.toLowerCase()) ||
//                 item.salaryTo
//                     .toString()
//                     .toLowerCase()
//                     .contains(query.toLowerCase()) ||
//                 item.salaryFrom
//                     .toString()
//                     .toLowerCase()
//                     .contains(query.toLowerCase()))
//             .toList()
//             .obs;
//
//         update();
//       } else {
//         jobs = jobs2;
//         update();
//       }
//     } catch (e) {
//       //
//     }
//   }
//
//   RxBool isApplied = false.obs;
//   referJob({required String id}) async {
//     try {
//       isLoading.value = true;
//       isApplied.value = await homeService.applyJob(
//         email: emailController.text,
//         name: nameController.text,
//         phone: mobileController.text,
//         position: id,
//         resumePath: resume!.path,
//       );
//       isApplied.value == true ? Get.to(() => HomeScreen()) : null;
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//     }
//   }
//
//   pickCustPhoto() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//     resumeController.text = result!.names.first.toString();
//     resume = File(result.files.first.path!);
//   }
// }
