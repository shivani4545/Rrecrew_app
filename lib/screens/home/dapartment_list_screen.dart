// import 'package:employee/controllers/department_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../utils/colors.dart';
// import '../../widgets/appbar.dart';
//
// class DepartmentListoingScreen extends StatelessWidget {
//   const DepartmentListoingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(DepartmentController());
//     return Scaffold(
//         appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(70),
//           child: MyAppBaar(title: "Departments"),
//         ),
//         body: SafeArea(
//             child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Obx(
//             () => controller.isLoading.value
//                 ? const Center(child: CircularProgressIndicator.adaptive())
//                 : Column(children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "ID",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: MyColors.blackColor,
//                             fontSize: MediaQuery.of(context).size.width * .03,
//                             fontFamily: 'Nunito',
//                           ),
//                         ),
//                         Text(
//                           "DEPARTMENT NAME",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: MyColors.blackColor,
//                             fontSize: MediaQuery.of(context).size.width * .03,
//                             fontFamily: 'Nunito',
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Divider(),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount:
//                             controller.department.value!.departments!.length,
//                         physics: const ScrollPhysics(),
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) => Padding(
//                           padding: const EdgeInsets.only(bottom: 5),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 controller
//                                     .department.value!.departments![index].id
//                                     .toString(),
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: MyColors.blackColor,
//                                   fontSize:
//                                       MediaQuery.of(context).size.width * .03,
//                                   fontFamily: 'Nunito',
//                                 ),
//                               ),
//                               Text(
//                                 controller.department.value!.departments![index]
//                                     .deptName
//                                     .toString(),
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: MyColors.blackColor,
//                                   fontSize:
//                                       MediaQuery.of(context).size.width * .03,
//                                   fontFamily: 'Nunito',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ]),
//           ),
//         )));
//   }
// }
