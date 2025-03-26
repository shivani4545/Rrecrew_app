// import 'package:employee/controllers/reward_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../utils/colors.dart';
// import '../../widgets/appbar.dart';
//
// class MyrewardsScreen extends StatelessWidget {
//   const MyrewardsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(RewardsController());
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(70),
//         child: MyAppBaar(title: "My Rewards"),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Obx(
//           () => controller.isLoading.value
//               ? const Center(child: CircularProgressIndicator.adaptive())
//               : Column(
//                   children: [
//                     // TextFormFields(
//                     //   controller: controller.searchController,
//                     //   labeltext: "Search",
//                     //   onTap: () {},
//                     // ),
//                     const SizedBox(height: 20),
//                     controller.rewards.value!.assigns == null ||
//                             controller.rewards.value == null
//                         ? Center(
//                             child: Text(
//                               "Data Not Available",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: MyColors.blackColor,
//                                 fontSize:
//                                     MediaQuery.of(context).size.width * .035,
//                                 fontFamily: 'Nunito',
//                               ),
//                             ),
//                           )
//                         : ListView.builder(
//                             shrinkWrap: true,
//                             itemCount:
//                                 controller.rewards.value!.assigns!.length,
//                             itemBuilder: (context, index) => Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: MyColors.whiteColor,
//                                   border:
//                                       Border.all(color: MyColors.darkBlueColor),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(4.0),
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Text(
//                                             "Award : ",
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
//                                           Text(
//                                             controller.rewards.value!
//                                                 .assigns![index].award!.name
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
//                                         ],
//                                       ),
//                                       const SizedBox(height: 15),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             "Date : ",
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
//                                           Text(
//                                             controller.rewards.value!
//                                                 .assigns![index].date
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
//                                         ],
//                                       ),
//                                       const SizedBox(height: 15),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             "Reason : ",
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
//                                           SizedBox(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 .6,
//                                             child: Text(
//                                               controller.rewards.value!
//                                                   .assigns![index].reason
//                                                   .toString(),
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: MyColors.blackColor,
//                                                 fontSize: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .035,
//                                                 fontFamily: 'Nunito',
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 15),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             "Bonus: ",
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
//                                           Text(
//                                             "₹${controller.rewards.value!.assigns![index].amount}",
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
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                   ],
//                 ),
//         ),
//       )),
//     );
//   }
// }
