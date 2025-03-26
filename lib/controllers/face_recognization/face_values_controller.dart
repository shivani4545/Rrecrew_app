import 'dart:async';
import 'dart:collection';
import 'package:camera/camera.dart';
import 'package:employee/service/face_recognization/face_recognization_service.dart';
import 'package:employee/service/home_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../home_controller.dart';

class FaceValuesController extends GetxController {

  @override
  void onInit() {
    controller =Get.find<HomeController>();
    try{
      userId = controller.user.value!.details!.id.toString();
    }catch (e){
      userId= "";
    }
    getFaceValue();
    super.onInit();
  }

  FaceRecognizationService faceRecognizationService = FaceRecognizationService();
  late final controller;
  late String userId;


  RxBool isLoading = false.obs;
  bool imagesExists = false;


  // Normal list of lists of doubles (representing faces)
  var faceValues = <List<double>>[];
  var currentFaceCount = 0;

  // Method to add a new array of doubles (face features)
  void addFaceValue(List<double> newArray) {
    faceValues.add(newArray);
    _updateFaceValueCount();
  }

  // Method to remove an array of doubles at a specific index
  void removeFaceValue(int index) {
    if (index >= 0 && index < faceValues.length) {
      faceValues.removeAt(index);
      _updateFaceValueCount();
    }
  }

  // Private method to update the current array count
  void _updateFaceValueCount() {
    currentFaceCount = faceValues.length;
  }


  getFaceValue() async {
    try {
      isLoading.value = true;
      imagesExists = await faceRecognizationService.getFaceValue();
      if(imagesExists){
        faceValues = await faceRecognizationService.temp;
        _updateFaceValueCount();
        //print("Testing FundFox FaceController : $currentFaceCount : $faceValues");
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }


  bool registerSucessfull = false;
  postFaceValue(List<List<double>> value) async {
    try {
      isLoading.value = true;
      registerSucessfull = await faceRecognizationService.postFaceValue(value);
      if(registerSucessfull){
        faceValues = value;
        imagesExists = true;
        _updateFaceValueCount();
        print("Testing FundFox FaceController : $currentFaceCount : $faceValues");
        return true;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
    return false;
  }



  late List<CameraDescription> cameras;

  setCameras(List<CameraDescription> cam){
    cameras = cam;
  }

  // RxMap for int keys and List<double> values
  var map = Rx<HashMap<int, List<double>>>(HashMap<int, List<double>>());

  // Method to add values to the HashMap
  void addValues(int key, List<double> values) {
    map.update((map) {
      map![key] = values; // Just directly assign values
    });
  }

  // Method to update values in the HashMap
  void updateValues(int key, List<double> values) {
    if (map.value.containsKey(key)) {
      map.update((map) {
        map![key] = values; // Update if key exists
      });
    }
  }

  // Method to clear the HashMap
  void clearMap() {
    map.update((map) {
      map!.clear(); // Clear the map
    });
  }

  // Method to check if the key exists and the value is not empty
  bool keyAndValueExist(int key) {
    return map.value.containsKey(key) && (map.value[key]?.isNotEmpty ?? false);
  }




//   Temp

  // Observable list of lists of doubles (representing faces)
  var faceArrays = <List<double>>[].obs;

  // Observable current count of arrays
  var currentArrayCount = 0.obs;

  // Method to add a new array of doubles (face features)
  void addFaceArray(List<double> newArray) {
    faceArrays.add(newArray);
    _updateArrayCount();
  }

  // Method to remove an array of doubles at a specific index
  void removeFaceArray(int index) {
    if (index >= 0 && index < faceArrays.length) {
      faceArrays.removeAt(index);
      _updateArrayCount();
    }
  }

  // Private method to update the current array count
  void _updateArrayCount() {
    currentArrayCount.value = faceArrays.length;
  }

}
