import 'package:employee/controllers/home_controller.dart';
import 'package:employee/screens/home/attendance_screen.dart';
import 'package:employee/screens/home/branches_screen.dart';
import 'package:employee/screens/home/faq_screen.dart';
import 'package:employee/screens/home/holiday_screen.dart';
import 'package:employee/screens/home/job_list_screen.dart';
import 'package:employee/screens/home/leave_list_screen.dart';
import 'package:employee/screens/home/meeting_list_screen.dart';
import 'package:employee/screens/home/payroll_screen.dart';
import 'package:employee/screens/home/penalty_screen.dart';
import 'package:employee/screens/home/profile_screen.dart';
import 'package:employee/screens/home/reumbrsement_screen.dart';
import 'package:employee/screens/home/reward_screen.dart';
import 'package:employee/screens/home/support_screen.dart';
import 'package:employee/screens/recognization/face_verification_screen.dart';
import 'package:employee/screens/recognization/new_face_register_screen.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/widgets/drawer.dart';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/face_recognization/face_values_controller.dart';
import '../../controllers/login_controller.dart';
import '../../utils/apis.dart';
import '../../widgets/button.dart';
import '../../widgets/linkwidget.dart';
import 'company_policies_screen.dart';
import 'feedback_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  late List<CameraDescription> cameras;

  bool? faceRecognization;

  checkForUserFaceVerificationEnabled(HomeController controller, BuildContext context) async {
    // await checkUserFaceRegonizationPreference();

    if (faceRecognization == null) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            content: const Text("Hello! Would you like to enable face recognition for secure attendance tracking?"),
            title: const Text("Face Recognition for \nCheck-In/Check-Out"),
            actions: <Widget>[
              CupertinoDialogAction(
                // isDefaultAction: true,
                child: const Text('Yes'),
                onPressed: () async {
                  await storeUserPreference(controller, true);
                  faceRecognization = true;
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                // isDefaultAction: true,
                child: const Text('No'),
                onPressed: () async {
                  await storeUserPreference(controller, false);
                  faceRecognization = false;
                  Navigator.pop(context);
                },
              ),
            ],
          ));
    } else {}
  }

  getFaceRegonizationPreference(HomeController controller) async {
    await controller.fetchFaceRecognizationValues();
  }

  storeUserPreference(HomeController controller, bool val) async {
    await controller.setFaceRecognizationValues(val);
  }

  bool initialized = false;

  userInitialProcess(HomeController controller, BuildContext context) async {
    await getFaceRegonizationPreference(controller);
    faceRecognization = controller.faceRecognization;
    if (faceRecognization == null) {
      checkForUserFaceVerificationEnabled(controller, context);
      // faceRecognization = controller.faceRecognization;
    }
  }

  @override
  Widget build(BuildContext context) {
    cameras = Get.put(LoginController()).cameras;
    final controller = Get.put(HomeController());
    var faceValueController = Get.put(FaceValuesController());
    faceValueController.setCameras(cameras);
    // final faceValueController = Get.put(FaceValuesController());

    if (!initialized) {
      userInitialProcess(controller, context);
      initialized = true;
    }

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        elevation: 0,
        iconTheme: const IconThemeData(color: MyColors.whiteColor),
        backgroundColor: MyColors.reColor,
        // title: Image(
        //   image: const AssetImage("assets/images/logo.png"),
        //   height: MediaQuery.of(context).size.height * .09,
        // ),
        title: const Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Nunito"),
        ),
      ),
      body: Obx(
            () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: controller.isLoading.value
                ? const Center(child: CircularProgressIndicator.adaptive())
                : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.grayColor,
                    border: Border.all(color: MyColors.blackColor),
                  ),
                  child: controller.isLoading.value == true
                      ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sunny,
                            color: MyColors.whiteColor,
                            size: MediaQuery.of(context).size.width * .08,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            controller.greetingName.value,
                            style: TextStyle(
                              color: MyColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width * .045,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: MyColors.whiteColor,
                            size: MediaQuery.of(context).size.width * .12,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            children: [
                              Text(
                               controller.user.value == null || controller.user.value!.details!.fullName == null ? "--" : controller.user.value!.details!.fullName.toString(),

                                style: TextStyle(
                                  color: MyColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width * .04,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              Text(
                                controller.user.value == null || controller.user.value!.details!.workEmail == "null" ? "--" : controller.user.value!.details!.workEmail.toString(),
                                style: TextStyle(
                                  color: MyColors.whiteColor,
                                  fontSize: MediaQuery.of(context).size.width * .03,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: MyColors.whiteColor,
                //     border: Border.all(color: MyColors.reColor),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(2.0),
                //         child: Column(
                //           children: [
                //             controller.ischeckLoading.value
                //                 ? const CircularProgressIndicator.adaptive()
                //                 : InkWell(
                //               onTap: () {
                //
                //                 if(faceRecognization == null || faceRecognization == false){
                //                   CheckInCheckOutWithoutFaceRecognize(controller , "1" , context);
                //                   return;
                //                 }
                //
                //
                //                 if (!faceValueController.imagesExists) {
                //                   Get.to(NewFaceRegisterScreen(cameras: faceValueController.cameras));
                //                   return;
                //                 }
                //
                //                 controller.user.value == null || controller.user.value!.details!.clockintime == "null" ? controller.chekin(faceValueController.cameras, faceValueController, controller) : showCheckSnackBar("Checked In", context, controller);
                //                 // controller.chekin();
                //               },
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                   color: controller.user.value == null || controller.user.value!.details!.clockintime == "null" ? MyColors.reColor : MyColors.reColor.withOpacity(0.75),
                //                   // color: MyColors.darkBlueColor,
                //                   borderRadius: BorderRadius.circular(5),
                //                 ),
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(8.0),
                //                   child: Text(
                //                     "Start Shift",
                //                     style: TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       color: MyColors.whiteColor,
                //                       fontSize: MediaQuery.of(context).size.width * .045,
                //                       fontFamily: 'Nunito',
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             const SizedBox(height: 10),
                //             Text(
                //               controller.user.value == null || controller.user.value!.details!.clockintime == "null" ? "--:--" : controller.user.value!.details!.clockintime.toString().replaceRange(5, 8, ""),
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 color: MyColors.blackColor,
                //                 fontSize: MediaQuery.of(context).size.width * .03,
                //                 fontFamily: 'Nunito',
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(2.0),
                //         child: Column(
                //           children: [
                //             controller.ischeckLoading2.value
                //                 ? const CircularProgressIndicator.adaptive()
                //                 : InkWell(
                //               onTap: () {
                //
                //                 if(faceRecognization == null || faceRecognization == false){
                //                   CheckInCheckOutWithoutFaceRecognize(controller , "2" , context);
                //                   return;
                //                 }
                //
                //                 if (controller.isclockin != null) {
                //                   if (controller.isclockin!.isFalse) {
                //                     Get.snackbar("", "Please start Shift first", colorText: Colors.white, backgroundColor: Colors.black);
                //                     return;
                //                   }
                //                 } else {
                //                   Get.snackbar("", "Please start Shift first", colorText: Colors.white, backgroundColor: Colors.black);
                //                   // showCheckSnackBar("Please Check In first", context, controller);
                //                   return;
                //                 }
                //
                //                 if (!faceValueController.imagesExists) {
                //                   Get.to(NewFaceRegisterScreen(cameras: faceValueController.cameras));
                //                   return;
                //                 }
                //
                //                 controller.user.value == null || controller.user.value!.details!.clockouttime == "null" ? controller.checkout(faceValueController.cameras, faceValueController, controller) : showCheckSnackBar("Checked Out", context, controller);
                //                 // controller.checkout();
                //               },
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                   color: controller.user.value == null || controller.user.value!.details!.clockouttime == "null" ? MyColors.reColor : MyColors.reColor.withOpacity(0.75),
                //                   // color: MyColors.darkBlueColor,
                //                   borderRadius: BorderRadius.circular(5),
                //                 ),
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(8.0),
                //                   child: Text(
                //                     "End Shift",
                //                     style: TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       color: MyColors.whiteColor,
                //                       fontSize: MediaQuery.of(context).size.width * .045,
                //                       fontFamily: 'Nunito',
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             const SizedBox(height: 10),
                //             Text(
                //               controller.user.value == null || controller.user.value!.details!.clockouttime == "null" ? "--:--" : controller.user.value!.details!.clockouttime.toString().replaceRange(5, 8, ""),
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 color: MyColors.blackColor,
                //                 fontSize: MediaQuery.of(context).size.width * .03,
                //                 fontFamily: 'Nunito',
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                // Button(
                //     ontap: () {
                //       Get.to(() => const MyMeetingScreen());
                //     },
                //     color: MyColors.darkBlueColor,
                //     titleColor: MyColors.whiteColor,
                //     title: "My Meetings"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Menu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackColor,
                      fontSize: MediaQuery.of(context).size.width * .05,
                      fontFamily: 'Nunito ',
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LinkWidget(
                      ontap: () {
                        Get.to(() => EventDetailScreen());
                      },
                      imagename: "assets/images/events.png",
                      name: "Events",
                    ),
                    LinkWidget(
                      ontap: () {
                        Get.to(() => const LeaveListScreen());
                      },
                      imagename: "assets/images/leave.png",
                      name: "Leave",
                    ),

                    // LinkWidget(
                    //   ontap: () {
                    //     Get.to(() => const AttendanceScreen());
                    //   },
                    //   imagename: "assets/images/atten.png",
                    //   name: "Attendance",
                    // ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LinkWidget(
                      ontap: () {
                        Get.to(() => const AttendanceScreen());
                      },
                      imagename: "assets/images/atten.png",
                      name: "Attendance",
                    ),

                    LinkWidget(
                      ontap: () {
                        Get.to(() => const HolidayScreen());
                      },
                      imagename: "assets/images/holi.png",
                      name: "Holiday",
                    ),
                    // LinkWidget(
                    //   ontap: () {
                    //     Get.to(() => const PayRollScreen());
                    //   },
                    //   imagename: "assets/images/pay.png",
                    //   name: "Payroll",
                    // ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LinkWidget(
                      ontap: () {
                        Get.to(() => const PayRollScreen());
                      },
                      imagename: "assets/images/pay.png",
                      name: "Payroll",
                    ),

                    LinkWidget(
                      ontap: () {
                        Get.to(() => const ReumbersmentScreen());
                      },
                      imagename: "assets/images/ream.png",
                      name: "Reimbursement",
                    ),
                    // LinkWidget(
                    //   ontap: () {
                    //     Get.to(() => const JobListScreen());
                    //   },
                    //   imagename: "assets/images/job.png",
                    //   name: "Job Vacancy",
                    // ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LinkWidget(
                      ontap: () {
                        Get.to(() => const ProfilrScreen());
                      },
                      imagename: "assets/images/profile.png",
                      name: "Profile",
                    ),
                    LinkWidget(
                      ontap: () {
                        Get.to(() => const FeedBackScreen());
                      },
                      imagename: "assets/images/feed.png",
                      name: "Feedback",
                    ),


                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // LinkWidget(
                    //   ontap: () {
                    //     Get.to(() => const ComnpniesPoliciesScreen());
                    //   },
                    //   imagename: "assets/images/poli.png",
                    //   name: "Policies",
                    // ),
                    // LinkWidget(
                    //   ontap: () {
                    //     Get.to(() => const SupportScreen());
                    //   },
                    //   imagename: "assets/images/cont.png",
                    //   name: "Support",
                    // ),
                  ],
                ),

                const SizedBox(height: 10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     LinkWidget(
                //       ontap: () {
                //         Get.to(() => const PenaltyScreen());
                //       },
                //       imagename: "assets/images/pena.png",
                //       name: "Penalty",
                //     ),
                //     LinkWidget(
                //       ontap: () {
                //         Get.to(() => const MyrewardsScreen());
                //       },
                //       imagename: "assets/images/rew.png",
                //       name: "Rewards",
                //     ),
                //   ],
                // ),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // LinkWidget(
                    //   ontap: () {
                    //     Get.to(() => const FeedBackScreen());
                    //   },
                    //   imagename: "assets/images/feed.png",
                    //   name: "Feedback",
                    // ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // CheckInCheckOutWithoutFaceRecognize(HomeController controller, String userType, BuildContext context) {
  //   if(userType == "1"){
  //
  //     controller.user.value == null || controller.user.value!.details!.clockintime == "null" ? controller.regularChekin() : showCheckSnackBar("Checked In", context, controller);
  //
  //   }else if (userType == "2") {
  //
  //     if (controller.isclockin != null) {
  //       if (controller.isclockin!.isFalse) {
  //         Get.snackbar("", "Please Check In first", colorText: Colors.white, backgroundColor: Colors.black);
  //         return;
  //       }
  //     } else {
  //       Get.snackbar("", "Please Check In first", colorText: Colors.white, backgroundColor: Colors.black);
  //       // showCheckSnackBar("Please Check In first", context, controller);
  //       return;
  //     }
  //
  //     controller.user.value == null || controller.user.value!.details!.clockouttime == "null" ? controller.regularCheckout(): showCheckSnackBar("Checked Out", context, controller);
  //     // controller.regularCheckout();
  //
  //   }
  // }
  //
  // showCheckSnackBar(String s, BuildContext context, HomeController controller) {
  //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You Have Already " + s) ,duration: Duration(seconds: 2), ));
  //   Get.snackbar("Already $s", "You Have Already $s at ${controller.user.value!.details!.clockintime.toString().replaceRange(5, 8, "")}",
  //       backgroundColor: MyColors.blackColor,
  //       icon: const Icon(
  //         Icons.error,
  //         color: Colors.white,
  //         size: 32,
  //       ),
  //       duration: const Duration(seconds: 2),
  //       colorText: MyColors.whiteColor);
  // }
}

