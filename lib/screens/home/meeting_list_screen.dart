import 'package:camera/camera.dart';
import 'package:employee/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controllers/events_controller.dart';
import '../../controllers/face_recognization/face_values_controller.dart';
import '../../controllers/login_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/appbar.dart';
import 'package:get/get.dart';

import '../recognization/new_face_register_screen.dart'; // Add GetX dependency

class EventDetailScreen extends StatelessWidget {
   EventDetailScreen({super.key});
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

    final controller = Get.put(EventsController());
    final homeController = Get.find<HomeController>();
    var faceValueController = Get.put(FaceValuesController());
    faceValueController.setCameras(cameras);
    // final faceValueController = Get.put(FaceValuesController());

    if (!initialized) {
      userInitialProcess(homeController, context);
      initialized = true;
    }
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: "Events"),
      ),
      backgroundColor: MyColors.whiteColor,
      body: SafeArea(
        child: Obx(()=>ListView.builder(
            itemCount: controller.events.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Card(
                      elevation: 3,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              softWrap: false,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.035,
                                  fontFamily: 'Nunito',
                                  color: MyColors.blackColor,
                                ),
                                children:  [
                                  TextSpan(
                                    text: "Id: ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "${controller.events[index].id}",
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              softWrap: false,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.035,
                                  fontFamily: 'Nunito',
                                  color: MyColors.blackColor,
                                ),
                                children:  [
                                  TextSpan(
                                    text: "Event Name: ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "${controller.events[index].eventName}",
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.035,
                                  fontFamily: 'Nunito',
                                  color: MyColors.blackColor,
                                ),
                                children:  [
                                  TextSpan(
                                    text: "Description:  ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "${controller.events[index].description}",
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.035,
                                  fontFamily: 'Nunito',
                                  color: MyColors.blackColor,
                                ),
                                children:  [
                                  TextSpan(
                                    text: "City: ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "${controller.events[index].city}",
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.035,
                                  fontFamily: 'Nunito',
                                  color: MyColors.blackColor,
                                ),
                                children:  [
                                  TextSpan(
                                    text: "Start Date & Time: ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "${controller.events[index].startDate}",
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.035,
                                  fontFamily: 'Nunito',
                                  color: MyColors.blackColor,
                                ),
                                children:  [
                                  TextSpan(
                                    text: "End Date & Time: ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "${controller.events[index].endDate}",
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.035,
                                  fontFamily: 'Nunito',
                                  color: MyColors.blackColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Location: ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "${controller.events[index].locationName}",
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Column(
                                      // children: [
                                      //   homeController.ischeckLoading.value
                                      //       ? const CircularProgressIndicator.adaptive()
                                      //       : InkWell(
                                      //     onTap: () {
                                      //
                                      //       if(faceRecognization == null || faceRecognization == false){
                                      //         CheckInCheckOutWithoutFaceRecognize(homeController , "1" , context);
                                      //         return;
                                      //       }
                                      //
                                      //
                                      //       if (!faceValueController.imagesExists) {
                                      //         Get.to(NewFaceRegisterScreen(cameras: faceValueController.cameras));
                                      //         return;
                                      //       }
                                      //
                                      //       homeController.user.value == null || homeController.user.value!.details!.clockintime == "null" ? homeController.chekin(faceValueController.cameras, faceValueController, homeController) : showCheckSnackBar("Checked In", context, homeController);
                                      //       // controller.chekin();
                                      //     },
                                      //     child: Container(
                                      //       decoration: BoxDecoration(
                                      //         color: homeController.user.value == null || homeController.user.value!.details!.clockintime == "null" ? MyColors.reColor : MyColors.reColor.withOpacity(0.75),
                                      //         // color: MyColors.darkBlueColor,
                                      //         borderRadius: BorderRadius.circular(5),
                                      //       ),
                                      //       child: Padding(
                                      //         padding: const EdgeInsets.all(8.0),
                                      //         child: Text(
                                      //           "Check In",
                                      //           style: TextStyle(
                                      //             fontWeight: FontWeight.bold,
                                      //             color: MyColors.whiteColor,
                                      //             fontSize: MediaQuery.of(context).size.width * .045,
                                      //             fontFamily: 'Nunito',
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   const SizedBox(height: 10),
                                      //   Text(
                                      //     homeController.user.value == null || homeController.user.value!.details!.clockintime == "null" ? "--:--" : homeController.user.value!.details!.clockintime.toString().replaceRange(5, 8, ""),
                                      //     style: TextStyle(
                                      //       fontWeight: FontWeight.bold,
                                      //       color: MyColors.blackColor,
                                      //       fontSize: MediaQuery.of(context).size.width * .03,
                                      //       fontFamily: 'Nunito',
                                      //     ),
                                      //   ),
                                      // ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Column(
                                      // children: [
                                      //   homeController.ischeckLoading2.value
                                      //       ? const CircularProgressIndicator.adaptive()
                                      //       : InkWell(
                                      //     onTap: () {
                                      //
                                      //       if(faceRecognization == null || faceRecognization == false){
                                      //         CheckInCheckOutWithoutFaceRecognize(homeController , "2" , context);
                                      //         return;
                                      //       }
                                      //
                                      //       if (homeController.isclockin != null) {
                                      //         if (homeController.isclockin!.isFalse) {
                                      //           Get.snackbar("", "Please Check In first", colorText: Colors.white, backgroundColor: Colors.black);
                                      //           return;
                                      //         }
                                      //       } else {
                                      //         Get.snackbar("", "Please Check In first", colorText: Colors.white, backgroundColor: Colors.black);
                                      //         // showCheckSnackBar("Please Check In first", context, controller);
                                      //         return;
                                      //       }
                                      //
                                      //       if (!faceValueController.imagesExists) {
                                      //         Get.to(NewFaceRegisterScreen(cameras: faceValueController.cameras));
                                      //         return;
                                      //       }
                                      //
                                      //       homeController.user.value == null || homeController.user.value!.details!.clockouttime == "null" ? homeController.checkout(faceValueController.cameras, faceValueController, homeController) : showCheckSnackBar("Checked Out", context, homeController);
                                      //       // controller.checkout();
                                      //     },
                                      //     child: Container(
                                      //       decoration: BoxDecoration(
                                      //         color: homeController.user.value == null || homeController.user.value!.details!.clockouttime == "null" ? MyColors.reColor : MyColors.reColor.withOpacity(0.75),
                                      //         // color: MyColors.darkBlueColor,
                                      //         borderRadius: BorderRadius.circular(5),
                                      //       ),
                                      //       child: Padding(
                                      //         padding: const EdgeInsets.all(8.0),
                                      //         child: Text(
                                      //           "Check Out",
                                      //           style: TextStyle(
                                      //             fontWeight: FontWeight.bold,
                                      //             color: MyColors.whiteColor,
                                      //             fontSize: MediaQuery.of(context).size.width * .045,
                                      //             fontFamily: 'Nunito',
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   const SizedBox(height: 10),
                                      //   Text(
                                      //     homeController.user.value == null || homeController.user.value!.details!.clockouttime == "null" ? "--:--" : homeController.user.value!.details!.clockouttime.toString().replaceRange(5, 8, ""),
                                      //     style: TextStyle(
                                      //       fontWeight: FontWeight.bold,
                                      //       color: MyColors.blackColor,
                                      //       fontSize: MediaQuery.of(context).size.width * .03,
                                      //       fontFamily: 'Nunito',
                                      //     ),
                                      //   ),
                                      // ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),




                    ),
                  ],
                ),
              );
            })),
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
  }
//}