// import 'package:camera/camera.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../../controllers/face_recognization/face_values_controller.dart';
// import '../../controllers/home_controller.dart';
// import '../../controllers/login_controller.dart';
// import '../../utils/colors.dart';
// import '../recognization/new_face_register_screen.dart';  // Make sure this path is correct
// //import 'package:flutter/cupertino.dart'; // redundant import
// //import 'package:get/get.dart';   // If MarkAttendancePage is a GetView you need this.
// //import 'your_controller.dart';  //Import your controller. Replace with actual controller
//
// class MarkAttendancePage extends StatelessWidget {
//   MarkAttendancePage({super.key});
//   late List<CameraDescription> cameras;
//
//   bool? faceRecognization;
//
//   checkForUserFaceVerificationEnabled(HomeController controller, BuildContext context) async {
//     // await checkUserFaceRegonizationPreference();
//
//     if (faceRecognization == null) {
//       showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (BuildContext context) => CupertinoAlertDialog(
//             content: const Text("Hello! Would you like to enable face recognition for secure attendance tracking?"),
//             title: const Text("Face Recognition for \nCheck-In/Check-Out"),
//             actions: <Widget>[
//               CupertinoDialogAction(
//                 // isDefaultAction: true,
//                 child: const Text('Yes'),
//                 onPressed: () async {
//                   await storeUserPreference(controller, true);
//                   faceRecognization = true;
//                   Navigator.pop(context);
//                 },
//               ),
//               CupertinoDialogAction(
//                 // isDefaultAction: true,
//                 child: const Text('No'),
//                 onPressed: () async {
//                   await storeUserPreference(controller, false);
//                   faceRecognization = false;
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ));
//     } else {}
//   }
//
//   getFaceRegonizationPreference(HomeController controller) async {
//     await controller.fetchFaceRecognizationValues();
//   }
//
//   storeUserPreference(HomeController controller, bool val) async {
//     await controller.setFaceRecognizationValues(val);
//   }
//
//   bool initialized = false;
//
//   userInitialProcess(HomeController controller, BuildContext context) async {
//     await getFaceRegonizationPreference(controller);
//     faceRecognization = controller.faceRecognization;
//     if (faceRecognization == null) {
//       checkForUserFaceVerificationEnabled(controller, context);
//       // faceRecognization = controller.faceRecognization;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     cameras = Get.put(LoginController()).cameras;
//     final controller = Get.put(HomeController());
//     var faceValueController = Get.put(FaceValuesController());
//     faceValueController.setCameras(cameras);
//     bool? faceRecognization = true; // Replace with your actual value retrieval
//     //final YourController controller = Get.find(); // Get instance of your controller
//     //final FaceValueController faceValueController = Get.find();
//     if (!initialized) {
//       userInitialProcess(controller, context);
//       initialized = true;
//     }
//     return Scaffold(
//       appBar: AppBar(title: const Text('Mark Attendance')),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//        child:
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: MyColors.whiteColor,
//             border: Border.all(color: MyColors.darkBlueColor),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Column(
//                   children: [
//                     controller.ischeckLoading.value
//                         ? const CircularProgressIndicator.adaptive()
//                         : InkWell(
//                             onTap: () {
//
//                               if(faceRecognization == null || faceRecognization == false){
//                                 CheckInCheckOutWithoutFaceRecognize(controller , "1" , context);
//                                 return;
//                               }
//
//
//                               if (!faceValueController.imagesExists) {
//                                 Get.to(NewFaceRegisterScreen(cameras: faceValueController.cameras));
//                                 return;
//                               }
//
//                               controller.user.value == null || controller.user.value!.details!.clockintime == "null" ? controller.chekin(faceValueController.cameras, faceValueController, controller) : showCheckSnackBar("Checked In", context, controller);
//                               // controller.chekin();
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: controller.user.value == null || controller.user.value!.details!.clockintime == "null" ? MyColors.darkBlueColor : MyColors.darkBlueColor.withOpacity(0.75),
//                                 // color: MyColors.darkBlueColor,
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   "Check In",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: MyColors.whiteColor,
//                                     fontSize: MediaQuery.of(context).size.width * .045,
//                                     fontFamily: 'Nunito',
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                     const SizedBox(height: 10),
//                     Text(
//                       controller.user.value == null || controller.user.value!.details!.clockintime == "null" ? "--:--" : controller.user.value!.details!.clockintime.toString().replaceRange(5, 8, ""),
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: MyColors.blackColor,
//                         fontSize: MediaQuery.of(context).size.width * .03,
//                         fontFamily: 'Nunito',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Column(
//                   children: [
//                     controller.ischeckLoading2.value
//                         ? const CircularProgressIndicator.adaptive()
//                         : InkWell(
//                             onTap: () {
//
//                               if(faceRecognization == null || faceRecognization == false){
//                                 CheckInCheckOutWithoutFaceRecognize(controller , "2" , context);
//                                 return;
//                               }
//
//                               if (controller.isclockin != null) {
//                                 if (controller.isclockin!.isFalse) {
//                                   Get.snackbar("", "Please Check In first", colorText: Colors.white, backgroundColor: Colors.black);
//                                   return;
//                                 }
//                               } else {
//                                 Get.snackbar("", "Please Check In first", colorText: Colors.white, backgroundColor: Colors.black);
//                                 // showCheckSnackBar("Please Check In first", context, controller);
//                                 return;
//                               }
//
//                               if (!faceValueController.imagesExists) {
//                                 Get.to(NewFaceRegisterScreen(cameras: faceValueController.cameras));
//                                 return;
//                               }
//
//                               controller.user.value == null || controller.user.value!.details!.clockouttime == "null" ? controller.checkout(faceValueController.cameras, faceValueController, controller) : showCheckSnackBar("Checked Out", context, controller);
//                               // controller.checkout();
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: controller.user.value == null || controller.user.value!.details!.clockouttime == "null" ? MyColors.darkBlueColor : MyColors.darkBlueColor.withOpacity(0.75),
//                                 // color: MyColors.darkBlueColor,
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   "Check Out",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: MyColors.whiteColor,
//                                     fontSize: MediaQuery.of(context).size.width * .045,
//                                     fontFamily: 'Nunito',
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                     const SizedBox(height: 10),
//                     Text(
//                       controller.user.value == null || controller.user.value!.details!.clockouttime == "null" ? "--:--" : controller.user.value!.details!.clockouttime.toString().replaceRange(5, 8, ""),
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: MyColors.blackColor,
//                         fontSize: MediaQuery.of(context).size.width * .03,
//                         fontFamily: 'Nunito',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//       ),
//     );
//   }
// }
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
