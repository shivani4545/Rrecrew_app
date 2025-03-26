// import 'package:employee/controllers/support_controller.dart';
// import 'package:employee/utils/colors.dart';
// import 'package:employee/widgets/button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../widgets/appbar.dart';
// import '../../widgets/drop_down.dart';
// import '../../widgets/textformfield.dart';
//
// class SupportScreen extends StatelessWidget {
//   const SupportScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SupportController());
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(70),
//         child: MyAppBaar(title: "Support"),
//       ),
//       body: Form(
//         key: controller.formkey,
//         child: SingleChildScrollView(
//           child: SafeArea(
//               child: Obx(
//             () => controller.isLoading.value
//                 ? const Center(
//                     child: CircularProgressIndicator.adaptive(),
//                   )
//                 : Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.support_agent,
//                             size: MediaQuery.of(context).size.width * .4,
//                             color: MyColors.darkBlueColor,
//                           ),
//                           Text(
//                             "How We Can Help You",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: MyColors.blackColor,
//                               fontSize:
//                                   MediaQuery.of(context).size.width * .045,
//                               fontFamily: 'Nunito',
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           PrimaryDropDown(
//                             hintText: "Select Department",
//                             items: controller.department.value!.departments!
//                                 .map((e) => e.deptName.toString())
//                                 .toList(),
//                             onChanged: (val) {
//                               controller.departMent.value = controller
//                                   .department.value!.departments!
//                                   .where((e) => e.deptName == val)
//                                   .first
//                                   .id
//                                   .toString();
//                             },
//                           ),
//                           const SizedBox(height: 20),
//                           TextFormFields(
//                             inputtype: TextInputType.number,
//                             controller: controller.mobileController,
//                             labeltext: "Mobile Number",
//                             icon: const Icon(Icons.phone),
//                             validation: "Please Enter Mobile Number",
//                           ),
//                           const SizedBox(height: 25),
//                           TextFormFields(
//                             controller: controller.descriptionController,
//                             labeltext: "Description",
//                             icon: const Icon(Icons.phone),
//                             validation: "Please Enter Description",
//                           ),
//                           const SizedBox(height: 25),
//                           TextFormFields(
//                             controller: controller.emailController,
//                             labeltext: "Email Address",
//                             icon: const Icon(Icons.email),
//                             validation: "Please Enter Email ",
//                           ),
//                           const SizedBox(height: 25),
//                           SizedBox(
//                             child: TextFormFields(
//                               controller: controller.messageController,
//                               labeltext: "Message",
//                               icon: const Icon(Icons.message),
//                               validation: "Please Enter Message",
//                             ),
//                           ),
//                           const SizedBox(height: 25),
//                           controller.isLoading.value
//                               ? const CircularProgressIndicator.adaptive()
//                               : Button(
//                                   ontap: () {
//                                     if (controller.departMent.value == "") {
//                                       Get.snackbar(
//                                           "", "Please Select Department",
//                                           backgroundColor: MyColors.blackColor,
//                                           colorText: MyColors.whiteColor);
//                                     } else {
//                                       if (controller.formkey.currentState!
//                                           .validate()) {
//                                         controller.conatctUs();
//                                       }
//                                     }
//                                   },
//                                   color: MyColors.blueColor,
//                                   titleColor: MyColors.whiteColor,
//                                   title: "Submit")
//                         ],
//                       ),
//                     ),
//                   ),
//           )),
//         ),
//       ),
//     );
//   }
// }
