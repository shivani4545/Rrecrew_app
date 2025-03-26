import 'dart:convert';
import 'dart:ffi';
import 'package:employee/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/apis.dart';


class FaceRecognizationService {

  List<List<double>> temp = [];

  Future<bool> getFaceValue() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      if (kDebugMode) {
        print("Testing FundFox UserId: $userId");
      }

      final uri = Uri.parse(Apis.getFaceValue);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "userId": userId,
      };
      final response = await http.post(uri,headers: header);
      print(header);
      print(body);
      print(response.body);
      if (kDebugMode) {
        print("Testing FundFox FaceValues: ${response.body}");
      }
      // final responseData = json.decode(response.body);
      final responseData = json.decode(response.body) as Map<String , dynamic>;

      if(responseData.containsKey("images")){
        if (kDebugMode) {
          print("Testing FundFox FaceValuesDecode : ${responseData.values.elementAtOrNull(1)}");
        }
        if(responseData.values.elementAt(1) != null && responseData.values.elementAt(1).length != 0){
          temp = await parseNestedList(responseData.values.elementAt(1).toString());
          return true;
        }else{
          Get.snackbar("", "No Face Registered",
              backgroundColor: MyColors.blackColor,
              colorText: MyColors.whiteColor);
          return false;
        }
      }else{
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Testing FundFox Error : $e");
      }
      Get.snackbar("", "Failed to fetch Data",
          backgroundColor: MyColors.blackColor,
          colorText: MyColors.whiteColor);
      return false;
    }
  }

  Future<bool> postFaceValue(List<List<double>> value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      if (kDebugMode) {
        print("Testing FundFox UserId Posting: $userId");
      }

      final uri = Uri.parse(Apis.putFaceValue);
      final body = {
        "userId": userId,
        "images": value.toString(),
      };
      final response = await http.post(uri, body: body);
      if (kDebugMode) {
        print("Testing FundFox FaceValues Posting: ${response.body}");
      }
      final responseData = json.decode(response.body);

      if (response.statusCode.toString() == "200") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Testing FundFox Error Posting: $e");
      }
      Get.snackbar("", "Failed to Register Faces",
          backgroundColor: MyColors.blackColor,
          colorText: MyColors.whiteColor);
      return false;
    }
  }



  List<double> convertStringToDouble(String input) {
    // print("Testing Inside initial : " + input.toString());
    // Remove the brackets from the string
    String trimmedInput = input.replaceAll('[', '').replaceAll(']', '');

    // Split the string by commas to get individual number substrings
    List<String> stringList = trimmedInput.split(',')
        .map((s) => s.trim()) // Remove any extra spaces
        .toList();

    // Convert each string to a double and return as a List<double>
    List<double> doubleList = stringList.map((s) {
      try {
        return double.parse(s);
      } catch (e) {
        // Handle any potential parsing errors
        if (kDebugMode) {
          print('Testing Error parsing "$s" to double: $e');
        }
        return 0.0; // You can handle this case differently if needed
      }
    }).toList();
    // print("Testing Inside : " + doubleList.toString());
    return doubleList;
  }


  List<double> convertStringToDoubleList(String input) {
    // Step 1: Remove the surrounding brackets and quotes, and split by comma
    String cleanedInput = input.replaceAll(RegExp(r'[\[\]" ]'), '');
    List<String> stringList = cleanedInput.split(',');

    // Step 2: Convert to List<double>
    List<double> doubleList = stringList.map((e) => double.tryParse(e) ?? 0.0).toList();

    return doubleList;
  }

  List<List<double>> parseNestedList(String str) {
    // Remove the outer brackets
    str = str.substring(2, str.length - 2);

    return str.split('], [').map((inner) {
      // Remove brackets and split by comma
      return inner.replaceAll(RegExp(r'[\[\]]'), '').split(', ').map((numStr) {
        return double.parse(numStr);
      }).toList();
    }).toList();
  }


}
