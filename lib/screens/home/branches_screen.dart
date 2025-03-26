// import 'package:employee/controllers/branch_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../utils/colors.dart';
//
// class BranchesScreen extends StatelessWidget {
//   const BranchesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(BranchesController());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         automaticallyImplyLeading: true,
//         toolbarHeight: MediaQuery.of(context).size.height * .1,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: MyColors.whiteColor),
//         backgroundColor: MyColors.darkBlueColor,
//         title: Image(
//           image: const AssetImage("assets/images/fundfox.png"),
//           height: MediaQuery.of(context).size.height * .09,
//         ),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Obx(
//           () => controller.isLoading.value
//               ? const Center(child: CircularProgressIndicator.adaptive())
//               : Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: const ScrollPhysics(),
//                         itemCount: controller.branch.value!.branches!.length,
//                         itemBuilder: (context, index) => Padding(
//                           padding: const EdgeInsets.only(bottom: 5.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: MyColors.whiteColor,
//                               border: Border.all(color: MyColors.darkBlueColor),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         const Icon(
//                                           Icons.location_city_rounded,
//                                           color: MyColors.darkBlueColor,
//                                         ),
//                                         const SizedBox(width: 10),
//                                         Text(
//                                           controller.branch.value!
//                                               .branches![index].branchName
//                                               .toString(),
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: MyColors.blackColor,
//                                             fontSize: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 .035,
//                                             fontFamily: 'Nunito ',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 15),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "Brach City : ",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: MyColors.blackColor,
//                                             fontSize: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 .035,
//                                             fontFamily: 'Nunito',
//                                           ),
//                                         ),
//                                         Text(
//                                           controller.branch.value!
//                                               .branches![index].branchCity
//                                               .toString(),
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: MyColors.blackColor,
//                                             fontSize: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 .035,
//                                             fontFamily: 'Nunito',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 15),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "Office Manager : ",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: MyColors.blackColor,
//                                             fontSize: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 .035,
//                                             fontFamily: 'Nunito',
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               .6,
//                                           child: Text(
//                                             controller.branch.value!
//                                                 .branches![index].managerId
//                                                 .toString(),
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: MyColors.blackColor,
//                                               fontSize: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   .035,
//                                               fontFamily: 'Nunito',
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 15),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "Office Address : ",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: MyColors.blackColor,
//                                             fontSize: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 .035,
//                                             fontFamily: 'Nunito',
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               .6,
//                                           child: Text(
//                                             controller.branch.value!
//                                                 .branches![index].branchAddress
//                                                 .toString(),
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: MyColors.blackColor,
//                                               fontSize: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   .035,
//                                               fontFamily: 'Nunito',
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//         ),
//       )),
//     );
//   }
// }
