// import 'package:employee/controllers/penalty_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../utils/colors.dart';
// import '../../widgets/appbar.dart';
//
// class PenaltyScreen extends StatelessWidget {
//   const PenaltyScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(PenaltyController());
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(70),
//         child: MyAppBaar(title: "My Penalty"),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Obx(
//           () => controller.isLoading.value
//               ? const Center(child: CircularProgressIndicator.adaptive())
//               : Column(
//                   children: [
//                     const SizedBox(height: 20),
//                     controller.penalty.value!.penalties == null ||
//                             controller.penalty.value!.penalties!.isEmpty
//                         ? const Align(
//                             alignment: Alignment.center,
//                             child: Text("No Penalty Found !!"))
//                         : Expanded(
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               physics: const ScrollPhysics(),
//                               itemCount:
//                                   controller.penalty.value!.penalties!.length,
//                               itemBuilder: (context, index) => Padding(
//                                 padding: const EdgeInsets.only(bottom: 5),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: MyColors.whiteColor,
//                                     border: Border.all(
//                                         color: MyColors.darkBlueColor),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: Column(
//                                       children: [
//                                         const SizedBox(height: 5),
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "Date : ",
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
//                                             Text(
//                                               controller.penalty.value!
//                                                   .penalties![index].date
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
//                                           ],
//                                         ),
//                                         const SizedBox(height: 15),
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "Reason : ",
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
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   .6,
//                                               child: Text(
//                                                 controller.penalty.value!
//                                                     .penalties![index].reason
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   color: MyColors.blackColor,
//                                                   fontSize:
//                                                       MediaQuery.of(context)
//                                                               .size
//                                                               .width *
//                                                           .035,
//                                                   fontFamily: 'Nunito',
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 15),
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "Penalty: ",
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
//                                             Text(
//                                               "₹${controller.penalty.value!.penalties![index].amount}",
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
//                                           ],
//                                         ),
//                                       ],
//                                     ),
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
