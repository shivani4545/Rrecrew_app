// import 'package:employee/controllers/jobs_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../utils/colors.dart';
// import '../../widgets/appbar.dart';
// import '../../widgets/button.dart';
// import '../../widgets/textformfield.dart';
//
// class ReferCandidateScreen extends StatelessWidget {
//   final String jobid;
//   const ReferCandidateScreen({super.key, required this.jobid});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<JobsController>();
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(70),
//         child: MyAppBaar(title: "Refer"),
//       ),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Form(
//             key: controller.formkey,
//             child: Column(
//               children: [
//                 const SizedBox(height: 25),
//                 TextFormFields(
//                   controller: controller.refrenceController,
//                   labeltext: "Refrence No",
//                   icon: const Icon(Icons.numbers),
//                   validation: "Please Enter Reference No",
//                 ),
//                 const SizedBox(height: 25),
//                 TextFormFields(
//                   controller: controller.nameController,
//                   labeltext: "Candidate Name",
//                   icon: const Icon(Icons.person_2),
//                   validation: "Please Enter Candidate Name",
//                 ),
//                 const SizedBox(height: 25),
//                 TextFormFields(
//                   controller: controller.mobileController,
//                   labeltext: "Candidate Phone No",
//                   icon: const Icon(Icons.phone),
//                   validation: "Please Enter Candidate Phone No",
//                 ),
//                 const SizedBox(height: 25),
//                 TextFormFields(
//                   controller: controller.emailController,
//                   labeltext: "Candidate Email",
//                   icon: const Icon(Icons.email),
//                   validation: "Please Enter Candidate Email",
//                 ),
//                 const SizedBox(height: 25),
//                 TextFormFields(
//                   onTap: () {
//                     controller.pickCustPhoto();
//                   },
//                   controller: controller.resumeController,
//                   labeltext: "Upload Resume",
//                   icon: const Icon(Icons.file_copy_sharp),
//                   validation: "Upload Resume",
//                 ),
//                 const SizedBox(height: 25),
//                 Obx(
//                   () => controller.isLoading.value
//                       ? const CircularProgressIndicator.adaptive()
//                       : Button(
//                           ontap: () {
//                             if (controller.formkey.currentState!.validate()) {
//                               controller.referJob(id: jobid);
//                             }
//                           },
//                           color: MyColors.blueColor,
//                           titleColor: MyColors.whiteColor,
//                           title: "Apply"),
//                 )
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
