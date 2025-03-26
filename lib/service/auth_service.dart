import 'dart:convert';
import 'package:employee/utils/colors.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/apis.dart';

class AuthService {
  //Login Function
  Future<RxBool> loginUser(String email, String password) async {
    try {
      final uri = Uri.parse(Apis.loginapi);
      final body = {
        "email": email,
        "password": password,
      };
      final response = await http.post(uri, body: body);
      print("Testing FundFox :${response.body}");
      final responseData = json.decode(response.body);
      if (responseData["status"].toString() == "200") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        final String userId = responseData["user_id"].toString();
        final String token = responseData["api_token"].toString();
        // print(userId);
        await prefs.setString('userId', userId);
        await prefs.setString('token', token);
        return true.obs;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return false.obs;
      }
    } catch (e) {
      print("Testing FundFox :$e");
      return false.obs;
    }
  }
}
