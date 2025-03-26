// import 'package:employee/controllers/jobs_controller.dart';
// import 'package:employee/screens/home/refer_candidate_screen.dart';
// import 'package:employee/widgets/textformfield.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';
// import '../../utils/colors.dart';
// import '../../widgets/appbar.dart';
//
// class JobListScreen extends StatelessWidget {
//   const JobListScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(JobsController());
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(70),
//         child: MyAppBaar(title: "Jobs"),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Obx(
//           () => controller.isLoading.value
//               ? const Center(child: CircularProgressIndicator.adaptive())
//               : Column(
//                   children: [
//                     TextFormFields(
//                       controller: controller.searchController,
//                       labeltext: "Search",
//                       onchnaged: ({required val}) => controller.serchJob(
//                           query: controller.searchController.text),
//                     ),
//                     const SizedBox(height: 20),
//                     GetBuilder<JobsController>(
//                       builder: (controller) => Expanded(
//                         child: ListView.builder(
//                           physics: const ScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: controller.jobs.length,
//                           itemBuilder: (context, index) => Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: MyColors.whiteColor,
//                                 border:
//                                     Border.all(color: MyColors.darkBlueColor),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "Job Title : ",
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
//                                           controller.jobs[index].roleName
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
//                                           "Department : ",
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
//                                           controller.jobs[index].title
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
//                                           "Location : ",
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
//                                           controller.jobs[index].location
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
//                                           "No. Of Vacancies : ",
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
//                                             controller.jobs[index].noOfVacancies
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
//                                           "Experience : ",
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
//                                           "${controller.jobs[index].experience} Years",
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
//                                           "Salary From : ",
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
//                                           "₹${controller.jobs[index].salaryFrom}",
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
//                                           "Salary To : ",
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
//                                           "₹${controller.jobs[index].salaryTo}",
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
//                                           "Status : ",
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
//                                           controller.jobs[index].status
//                                               .toString(),
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: MyColors.greenColor,
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
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         TextButton(
//                                           onPressed: () {
//                                             Get.to(() => ReferCandidateScreen(
//                                                   jobid: controller
//                                                       .jobs[index].id
//                                                       .toString(),
//                                                 ));
//                                           },
//                                           style: const ButtonStyle(
//                                               backgroundColor:
//                                                   MaterialStatePropertyAll(
//                                                       MyColors.darkBlueColor)),
//                                           child: const Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               Icon(
//                                                 Icons.person_3_outlined,
//                                                 color: MyColors.whiteColor,
//                                               ),
//                                               SizedBox(width: 15),
//                                               Text(
//                                                 "Refer",
//                                                 style: TextStyle(
//                                                   color: MyColors.whiteColor,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontFamily: 'Nunito',
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         TextButton(
//                                           onPressed: () async {
//                                             Share.share(
//                                                 "http://testhr.baiinfo.in/login");
//                                           },
//                                           style: const ButtonStyle(
//                                               backgroundColor:
//                                                   MaterialStatePropertyAll(
//                                                       MyColors.darkBlueColor)),
//                                           child: const Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             children: [
//                                               Icon(
//                                                 Icons.share,
//                                                 color: MyColors.whiteColor,
//                                               ),
//                                               SizedBox(width: 15),
//                                               Text(
//                                                 "Share",
//                                                 style: TextStyle(
//                                                   color: MyColors.whiteColor,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontFamily: 'Nunito',
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     )
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
