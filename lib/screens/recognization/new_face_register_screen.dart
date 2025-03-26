import 'dart:async';

import 'package:camera/camera.dart';
import 'package:employee/controllers/home_controller.dart';
import 'package:employee/screens/recognization/camera_preview_screen.dart';
import 'package:employee/screens/recognization/face_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/face_recognization/face_values_controller.dart';
import '../../utils/colors.dart';

class NewFaceRegisterScreen extends StatefulWidget {
  const NewFaceRegisterScreen({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  State<NewFaceRegisterScreen> createState() => _NewFaceRegisterScreenState();
}

class _NewFaceRegisterScreenState extends State<NewFaceRegisterScreen> {
  final FaceValuesController faceValueController =
      Get.find<FaceValuesController>();
  final HomeController homeController = Get.find<HomeController>();

  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (isInitialized == false) {
      isInitialized = true;
      Timer(
        const Duration(seconds: 1),
        () {
          showInstructionDialogBox(context);
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading:
              faceValueController.isLoading.value ? false : true,
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          elevation: 0,
          iconTheme: const IconThemeData(color: MyColors.whiteColor),
          backgroundColor: MyColors.darkBlueColor,
          title: Image(
            image: const AssetImage("assets/images/logo.png"),
            height: MediaQuery.of(context).size.height * .09,
          ),
        ),
        body: faceValueController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Face  Registration",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          letterSpacing: 1),
                    ),
                    Expanded(child: Container()),
                    // Button 1: Enabled only if the list has 0 elements
                    Obx(() => buildButton(
                          1,
                          'Face Image 1',
                          true,
                        )),
                    const SizedBox(height: 20),
                    Obx(() => buildButton(
                          2,
                          'Face Image 2',
                          true,
                        )),
                    const SizedBox(height: 20),
                    Obx(() => buildButton(
                          3,
                          'Face Image 3',
                          true,
                        )),
                    Expanded(child: Container()),
                    Visibility(
                      visible: true,
                      child: GestureDetector(
                        onTap: () {
                          registerFace();
                          if (faceValueController.map.value.length == 3) {
                          } else {
                            Get.snackbar("", "Add all Images",
                                colorText: Colors.white,
                                backgroundColor: Colors.black);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: MyColors.darkBlueColor,
                            // color: Colors.blue,
                            // color: !exits ? Colors.blue : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Obx(() {
                              return Text(
                                faceValueController.map.value.length == 3
                                    ? "Submit"
                                    : "Add All Images",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: false,
                      child: GestureDetector(
                        onTap: () {
                          if (faceValueController.map.value.length == 3) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FaceVerificationScreen(
                                      cameras: widget.cameras,
                                      searchUserId: "",
                                      faceValuesController: faceValueController,
                                      homeController: homeController,
                                      type: '1',
                                    )));
                          } else {
                            Get.snackbar("", "Add all Images",
                                colorText: Colors.white,
                                backgroundColor: Colors.black);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            // color: !exits ? Colors.blue : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Obx(() {
                              return Text(
                                faceValueController.map.value.length == 3
                                    ? "Verify Face Recognize"
                                    : "Add All Images",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        faceValueController.clearMap();
                        Get.snackbar("", "All Images Cleared",
                            colorText: Colors.white,
                            backgroundColor: Colors.black);
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: MyColors.darkBlueColor,
                          // color: Colors.blue,
                          // color: !exits ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Clear Images",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }

  // Helper method to build each button
  Widget buildButton(int index, String title, bool isEnabled) {
    bool exits = faceValueController.keyAndValueExist(index);

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isEnabled ? MyColors.darkBlueColor : Colors.grey,
                // color: isEnabled ? Colors.blue : Colors.grey,
                // color: !exits ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                // color: isEnabled ? Colors.blue : Colors.grey,
                color: !exits ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  exits ? Icons.verified : Icons.camera,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () async {
                  // faceRecognitionController.doFaceRegistrationOnFrame();
                  // await Recognizer();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => FaceRecognizationTesting(cameras: widget.cameras,)));
                  //
                  //controller.captureImage(index); // Capture new image

                  if (faceValueController.keyAndValueExist(index)) {
                    Get.snackbar("", "Image already Added",
                        colorText: Colors.white, backgroundColor: Colors.black);
                    for (var i in faceValueController.map.value.values) {
                      if (kDebugMode) {
                        print("Testing  : ${i.toString()}");
                      }
                    }
                    return;
                  }

                  if (isEnabled) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CameraPreviewScreen(
                              cameras: widget.cameras,
                              index: index,
                              faceValuesController: faceValueController,
                            )));
                  } else {
                    Get.snackbar("", "Please add all images");
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  registerFace() async {
    List<List<double>> values = faceValueController.map.value.values.toList();
    bool temp = await faceValueController.postFaceValue(values);
    Navigator.pop(context);
    if (temp) {
      Get.snackbar("", "Face Registered Successfully",
          backgroundColor: Colors.black, colorText: Colors.white);
    } else {
      Get.snackbar("", "Couldn't Register Face",
          backgroundColor: Colors.black, colorText: Colors.white);
    }
  }

  showInstructionDialogBox(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              content: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Please follow these steps to complete the face registration:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                        '1. Ensure that you are in a well-lit environment with a plain white background.'),
                    SizedBox(height: 10),
                    // Image.asset("assets/step1.jpg", width: 100, height: 100), // Image for step 1
                    SizedBox(height: 10),
                    Text(
                        '2. Center your face in the camera frame, looking straight ahead.'),
                    SizedBox(height: 10),
                    // Image.asset("assets/step2.jpg", width: 100, height: 100), // Image for step 2
                    SizedBox(height: 10),
                    Text(
                        '3. Stay still for a few seconds to capture the image clearly.'),
                    SizedBox(height: 10),
                    // Image.asset("assets/step3.jpg", width: 100, height: 100), // Image for step 3
                    SizedBox(height: 10),
                    Text(
                      'We will capture three images for better face recognition accuracy.',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              title: const Text("Face Recognition for Check-In/Check-Out"),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: const Text('Yes'),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }
}
