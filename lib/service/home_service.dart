import 'dart:convert';
import 'package:employee/models/attendence_model.dart';
import 'package:employee/models/branches_model.dart';
import 'package:employee/models/department_model.dart';
import 'package:employee/models/expence_model.dart';
import 'package:employee/models/holiday_model.dart';
import 'package:employee/models/jobs_model.dart';
import 'package:employee/models/latland_model.dart';
import 'package:employee/models/leave_model.dart';
import 'package:employee/models/payrol_model.dart';
import 'package:employee/models/policies_model.dart';
import 'package:employee/models/rewards_mdel.dart';
import 'package:employee/models/roles_model.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;
import '../models/employees_model.dart';
import '../models/events_model.dart';
import '../models/expence_type_model.dart';
import '../models/faqs_model.dart';
import '../models/penalty_model.dart';
import '../models/profile_model.dart';
import '../utils/apis.dart';
import '../utils/colors.dart';

class HomeService {
  bool? serviceEnabled;
  Future<bool> handleLocationPermission() async {
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled!) {
      Get.snackbar(
          "", 'Location services are disabled. Please enable the services',
          backgroundColor: MyColors.blackColor, colorText: MyColors.whiteColor);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("", 'Location permissions are denied',
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("",
          'Location permissions are permanently denied, we cannot request permissions.',
          backgroundColor: MyColors.blackColor, colorText: MyColors.whiteColor);

      return false;
    }
    return true;
  }

  Future<Profile?> getUserProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();

      final uri = Uri.parse(Apis.profile);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
      };
      final response = await http.post(uri,headers: header);
      print(response.body);
      final responseData = json.decode(response.body);
      //print(responseData["details"]["role_name"]);
      if (responseData["status_code"].toString() == "200") {
       print("object");
        final Profile profile = Profile.fromJson(responseData);
        return profile;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<LeaveModel> getUserLeave() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.leavelist);
      final body = {
        "user_id": userId,
      };
      final header ={
        "Authorization":"Bearer $token"
      };
      final response = await http.post(uri, headers: header);
      final responseData = json.decode(response.body);
      // print(responseData);
      if (responseData["status"].toString() == "200") {
        // print("object");
        final LeaveModel leaveModel = LeaveModel.fromJson(responseData);
        return leaveModel;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return LeaveModel();
      }
    } catch (e) {
      // print("dffd" + e.toString());
      return LeaveModel();
    }
  }

  Future<List<EventModel>> getEvents() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.events);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
      };
      final response = await http.get(uri,headers: header);
      print(header);
      print(body);
      print(response.body);
      final responseData = json.decode(response.body);
      // print(responseData);
      if (response.statusCode == 200) {
        final List<EventModel> eventModel = eventModelFromJson(response.body);
        return eventModel;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return [];
      }
    } catch (e) {
      // print("dffd" + e.toString());
      return [];
    }
  }


  Future<AttendanceModel> getUserAttendence({
    required String year,
    required String month,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();

      final uri = Uri.parse(Apis.attendence);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
        "month": month,
        "year": year,
      };
      final response = await http.get(uri,headers: header);
      // print(response.body);
      final responseData = json.decode(response.body);
      // print(responseData);
      if (responseData["status_code"].toString() == "200") {
        // print("object");
        final AttendanceModel attendanceModel =
        AttendanceModel.fromJson(responseData);
        return attendanceModel;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return AttendanceModel();
      }
    } catch (e) {
      return AttendanceModel();
    }
  }

  Future<List<Holiday>> getHolidays() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.holidays);
      final header = {
        "Authorization": "Bearer $token"
      };
      final response = await http.post(uri, headers: header);

      // Log the status code and body if the request wasn't successful
      if (response.statusCode != 200) {
        print("API Error: Status Code ${response.statusCode}, Body: ${response.body}");
        Get.snackbar(
          "API Error",
          "Failed to load holidays.  Status code: ${response.statusCode}", // Display status code
          backgroundColor: MyColors.blackColor,
          colorText: MyColors.whiteColor,
        );
        return [];
      }

      final responseData = json.decode(response.body);

      if (responseData["status_code"].toString() == "200") {
        List<dynamic> data = responseData["holidays"]; // 'holidays' should be a list of Holiday objects
        List<Holiday> holidays = data.map((e) => Holiday.fromJson(e)).toList();
        return holidays;
      } else {
        Get.snackbar(
          "",
          responseData["message"].toString(),
          backgroundColor: MyColors.blackColor,
          colorText: MyColors.whiteColor,
        );
        return [];
      }
    } catch (e) {
      print("Error in getHolidays service: $e"); // Log the error
      Get.snackbar(
        "Error",
        "Failed to load holidays. Please check your connection or try again later.",
        backgroundColor: MyColors.blackColor,
        colorText: MyColors.whiteColor,
      );
      return []; // Return an empty list in case of error
    }
  }
  // Future<RewarsModel> getUserRewards() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String userId = prefs.getString('userId').toString();
  //     final uri = Uri.parse(Apis.rewards);
  //     final body = {"user_id": userId};
  //     final response = await http.post(uri, body: body);
  //     final responseData = json.decode(response.body);
  //     if (responseData["status_code"].toString() == "200") {
  //       RewarsModel rewarsModel = RewarsModel.fromJson(responseData);
  //       return rewarsModel;
  //     } else {
  //       Get.snackbar("", responseData["message"].toString(),
  //           backgroundColor: MyColors.blackColor,
  //           colorText: MyColors.whiteColor);
  //       return RewarsModel();
  //     }
  //   } catch (e) {
  //     return RewarsModel();
  //   }
  // }


   // Future<List<Jobs>> getJobs() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String userId = prefs.getString('userId').toString();
  //     final uri = Uri.parse(Apis.jobs);
  //     final body = {
  //       "user_id": userId,
  //     };
  //     final response = await http.post(uri, body: body);
  //     // print(response.body);
  //     final responseData = json.decode(response.body);
  //     if (responseData["status_code"].toString() == "200") {
  //       List data = responseData["jobs"];
  //       List<Jobs> joblist = data.map((e) => Jobs.fromJson(e)).toList();
  //       return joblist;
  //     } else {
  //       Get.snackbar("", responseData["message"].toString(),
  //           backgroundColor: MyColors.blackColor,
  //           colorText: MyColors.whiteColor);
  //       return [];
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }

  // Future<PenltysModel> getuserPenltys() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String userId = prefs.getString('userId').toString();
  //     final uri = Uri.parse(Apis.penaltys);
  //     final body = {
  //       "user_id": userId,
  //     };
  //     final response = await http.post(uri, body: body);
  //     // print(response.body);
  //     final responseData = json.decode(response.body);
  //     // print(responseData);
  //     if (responseData["status_code"].toString() == "200") {
  //       PenltysModel penltysModel = PenltysModel.fromJson(responseData);
  //       return penltysModel;
  //     } else {
  //       Get.snackbar("", responseData["message"].toString(),
  //           backgroundColor: MyColors.blackColor,
  //           colorText: MyColors.whiteColor);
  //       return PenltysModel();
  //     }
  //   } catch (e) {
  //     // print(e);
  //     return PenltysModel();
  //   }
  // }

  // Future<BranchesModel> getofficeBranches() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String userId = prefs.getString('userId').toString();
  //     final uri = Uri.parse(Apis.branches);
  //     final body = {
  //       "user_id": userId,
  //     };
  //     final response = await http.post(uri, body: body);
  //     final responseData = json.decode(response.body);
  //     // print(responseData);
  //     if (responseData["status_code"].toString() == "200") {
  //       BranchesModel branchesModel = BranchesModel.fromJson(responseData);
  //       return branchesModel;
  //     } else {
  //       Get.snackbar("", responseData["message"].toString(),
  //           backgroundColor: MyColors.blackColor,
  //           colorText: MyColors.whiteColor);
  //       return BranchesModel();
  //     }
  //   } catch (e) {
  //     return BranchesModel();
  //   }
  // }

  // Future<DepartmentModel> getDeapartments() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String userId = prefs.getString('userId').toString();
  //     final uri = Uri.parse(Apis.department);
  //     final body = {
  //       "user_id": userId,
  //     };
  //     final response = await http.post(uri, body: body);
  //     final responseData = json.decode(response.body);
  //     // print(responseData);
  //     if (responseData["status_code"].toString() == "200") {
  //       DepartmentModel departmentModel =
  //       DepartmentModel.fromJson(responseData);
  //       return departmentModel;
  //     } else {
  //       Get.snackbar("", responseData["message"].toString(),
  //           backgroundColor: MyColors.blackColor,
  //           colorText: MyColors.whiteColor);
  //       return DepartmentModel();
  //     }
  //   } catch (e) {
  //     return DepartmentModel();
  //   }
  // }

  Future<RolesModel> getAllRoles() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.roles);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
      };
      final response = await http.get(uri,headers: header);
      final responseData = json.decode(response.body);
      if (responseData["status_code"].toString() == "200") {
        RolesModel rolesModel = RolesModel.fromJson(responseData);
        return rolesModel;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return RolesModel();
      }
    } catch (e) {
      return RolesModel();
    }
  }

  // Future<List<FaqsModel>> getAllFaqs() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String userId = prefs.getString('userId').toString();
  //     final uri = Uri.parse(Apis.faqs);
  //     final body = {
  //       "user_id": userId,
  //     };
  //     final response = await http.post(uri, body: body);
  //     // print(response.body);
  //     final responseData = json.decode(response.body);
  //     if (responseData["status_code"].toString() == "200") {
  //       List data = responseData["faqs"];
  //       List<FaqsModel> faqsmodel =
  //       data.map((e) => FaqsModel.fromJson(e)).toList();
  //       return faqsmodel;
  //     } else {
  //       Get.snackbar("", responseData["message"].toString(),
  //           backgroundColor: MyColors.blackColor,
  //           colorText: MyColors.whiteColor);
  //       return [];
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }

  Future<List<EmployeesModel>> getAllEmployees() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.allemployee);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
      };
      final response = await http.get(uri,headers: header);
      // print(response.body);
      final responseData = json.decode(response.body);
      if (responseData["status_code"].toString() == "200") {
        List data = responseData["emps"];
        List<EmployeesModel> employee =
        data.map((e) => EmployeesModel.fromJson(e)).toList();

        return employee;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return [];
      }
    } catch (e) {
      // print(e);
      return [];
    }
  }

  Future<List<PayRollModel>> getPayRoll() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.payroll);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
        "year": "2022",
      };
      final response = await http.post(uri, headers: header);
      // print(response.body);
      final responseData = json.decode(response.body);
      if (responseData["status_code"].toString() == "200") {
        List data = responseData["Emp_salary"];
        List<PayRollModel> payroll =
        data.map((e) => PayRollModel.fromJson(e)).toList();

        return payroll;
      } else {
        // Get.snackbar("", responseData["message"].toString(),
        //     backgroundColor: MyColors.blackColor,
        //     colorText: MyColors.whiteColor);
        return [];
      }
    } catch (e) {
      // print(e);
      return [];
    }
  }

  Future<List<PoliciesModel>> getPolicies() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.policy);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
      };
      final response = await http.post(uri, headers: header);
      // print(response.body);
      final responseData = json.decode(response.body);
      if (responseData["status_code"].toString() == "200") {
        List data = responseData["policies"];
        List<PoliciesModel> policies =
        data.map((e) => PoliciesModel.fromJson(e)).toList();
        // print(policies.length);
        return policies;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return [];
      }
    } catch (e) {
      // print(e);
      return [];
    }
  }

  Future<List<ExpenceModel>> getExpence() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();

      final uri = Uri.parse(Apis.expence);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
      };
      final response = await http.post(uri, headers: header);
      // print(response.body);
      final responseData = json.decode(response.body);
      if (responseData["status_code"].toString() == "200") {
        List data = responseData["expenses"];
        List<ExpenceModel> expences =
        data.map((e) => ExpenceModel.fromJson(e)).toList();
        // print(policies.length);
        return expences;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return [];
      }
    } catch (e) {
      // print(e);
      return [];
    }
  }

  Future<List<ExpenceTypeModel>> getExpenceType() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.expencetype);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
      };
      final response = await http.post(uri, headers: header);
      // print(response.body);
      final responseData = json.decode(response.body);
      if (responseData["status_code"].toString() == "200") {
        List data = responseData["categories"];
        List<ExpenceTypeModel> expences =
        data.map((e) => ExpenceTypeModel.fromJson(e)).toList();
        // print(policies.length);
        return expences;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return [];
      }
    } catch (e) {
      // print(e);
      return [];
    }
  }


  Future<bool> applyLeave({
    required String fromtime,
    required String toTime,
    required String toDate,
    required String fromDate,
    required String reason,
    required String type,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.applyleave);
      // print(type);
      //
      //final token = prefs.getString("token").toString();

      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
        "date_from": fromDate,
        "date_to": toDate,
        "to_time": toTime,
        "from_time": fromtime,
        "reason": reason,
        "leave_type_id": type,
      };
      final response = await http.post(uri, headers: header);
      // print(response.body);
      final responseData = json.decode(response.body);
      if (responseData["status_code"].toString() == "200") {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return true;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return false;
      }
    } catch (e) {
      // print(e);
      return false;
    }
  }

  Future<bool> addExpence({
    required String type,
    required String title,
    required String des,
    required String amount,
    required String date,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.addexpence);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
        "category_type_id": type,
        "date_of_purchase": date,
        "amount": amount,
        "item": title,
        "purchase_from": des,
      };
      final response = await http.post(uri, headers: header);
      // print(response.body);
      final responseData = json.decode(response.body);
      if (responseData["status_code"].toString() == "200") {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return true;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return false;
      }
    } catch (e) {
      // print(e);
      return false;
    }
  }

  Future<bool> addFeedback({
    required String ans1,
    required String ans2,
    required String ans3,
    required String ans4,
    required String ans5,
    required String ans6,
    required String ans7,
    required String ans8,
    required String ans9,
    required String ans10,
    required String ans11,
    required String ans12,
    required String ans13,
    required String ans14,
    required String ans15,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.feedback);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
        "que1": ans1,
        "que2": ans2,
        "que3": ans3,
        "que4": ans4,
        "que5": ans5,
        "que6": ans6,
        "que7": ans7,
        "que8": ans8,
        "que9": ans9,
        "que10": ans10,
        "que11": ans11,
        "que12": ans12,
        "que13": ans13,
        "que14": ans14,
        "que15": ans15,
      };
      final response = await http.post(uri, headers: header);
      // print(response.body);
      final responseData = json.decode(response.body);
      if (responseData["status_code"].toString() == "200") {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return true;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // Future<bool> applyJob({
  //   required String name,
  //   required String phone,
  //   required String email,
  //   required String position,
  //   required String resumePath,
  // }) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String userId = prefs.getString('userId').toString();
  //     Map<String, String> obj = {
  //       "user_id": userId,
  //       "name": name,
  //       "email": email,
  //       "position": position,
  //       "phone_no": phone,
  //     };
  //     http.MultipartRequest request =
  //     http.MultipartRequest('POST', Uri.parse(Apis.referjob));
  //     List<http.MultipartFile> allImages = [
  //       await http.MultipartFile.fromPath('apply', resumePath),
  //     ];
  //     request.files.addAll(allImages);
  //     request.fields.addAll(obj);
  //     http.StreamedResponse response = await request.send();
  //     // final respStr = await response.stream.bytesToString();
  //     // print(respStr);
  //     if (response.statusCode == 200) {
  //       Get.snackbar("", "Application send successfully!",
  //           backgroundColor: MyColors.blackColor,
  //           colorText: MyColors.whiteColor);
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }
  //
  // Future<bool> support({
  //   required String problem,
  //   required String email,
  //   required String phoneno,
  //   required String description,
  //   required String department,
  // }) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String userId = prefs.getString('userId').toString();
  //     final uri = Uri.parse(Apis.contactus);
  //     final body = {
  //       "user_id": userId,
  //       "email": email,
  //       "phone_no": phoneno,
  //       "description": description,
  //       "department": department,
  //     };
  //     final response = await http.post(uri, body: body);
  //     // print(response.body);
  //     final responseData = json.decode(response.body);
  //     if (responseData["status_code"].toString() == "200") {
  //       Get.snackbar("", responseData["message"].toString(),
  //           backgroundColor: MyColors.blackColor,
  //           colorText: MyColors.whiteColor);
  //       return true;
  //     } else {
  //       Get.snackbar("", responseData["message"].toString(),
  //           backgroundColor: MyColors.blackColor,
  //           colorText: MyColors.whiteColor);
  //       return false;
  //     }
  //   } catch (e) {
  //     // print(e);
  //     return false;
  //   }
  // }


  Future<bool> clockIn({
    required String type,
    required String userId,
    required String imagePath,
  }) async {
    try {
      final uri = Uri.parse(Apis.clockinout); // Use the provided API URL

      // Create a multipart request

      final request = http.MultipartRequest('POST', uri);
      request.headers['Content-type'] = 'multipart/form-data';

      request.fields['user_id'] = userId;
      request.fields['clock_type'] = type;
      request.fields['datetime'] = DateTime.now().toString();

      if (type == "1") {
        request.files.add(
            await http.MultipartFile.fromPath('Check_in_selfie', imagePath));
      } else if (type == "2") {
        request.files.add(
            await http.MultipartFile.fromPath('Check_out_selfie', imagePath));
      }

      // Send the request
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final responseData = json.decode(responseBody);

      // print("Testing : " + responseData.toString());

      // Check the response status
      if (response.statusCode == 200 &&
          responseData["status"].toString() == "200") {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return true;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return false;
    }
  }

  void testing() {}


  // Regular CheckIn Without Face Recognization
  //CheckInOut & Selfie Code
  final ImagePicker _picker = ImagePicker();

  Future<void> takePictureAndUpload(String type) async {
    try {
      // Get user ID from SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId') ?? '';
      final token = prefs.getString("token").toString();

      // Open the camera and take a picture
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image == null) {
        // Handle case where no image was selected
        Get.snackbar("Not able to Capture Your Image", "",
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return;
      } else {
        if (type == "1" || type == "2") {
          await clockIn(type: type, userId: userId, imagePath: image.path);
        } else {}
      }

    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  void testing2() {}

  Future<LatLangModel> getoffcelocation() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.getofficeinfo);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {"id": userId};
      final response = await http.post(uri,headers: header);
      // print(response.body);
      final responseData = json.decode(response.body);
      if (responseData["status_code"].toString() == "200") {
        LatLangModel langModel =
        LatLangModel.fromJson(responseData["branches"][0]);
        return langModel;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return LatLangModel();
      }
    } catch (e) {
      return LatLangModel();
    }
  }




  Future<bool?> fetchFaceRecognization() async {

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      // final String userId = "1";
      final token = prefs.getString("token").toString();

      final uri = Uri.parse(Apis.getRegcogValue);

      // final url = Apis.getRegcogValue;
      // final Uri uri = Uri.parse('$url?user_id=$userId');
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
      };

      final response = await http.post(uri, headers: header);

      // final response = await http.get(uri);

      if (kDebugMode) {
        print( "Testing FundFox Get User Preference FundFox : ${response.body}");
      }


      final responseData = json.decode(response.body);


      if (responseData['success'].toString() == "true") {

        if(responseData['prefs'] == "true"){
          if (kDebugMode) {
            print( "Testing FundFox Get User Preference Value true ");
          }
          return true;
        }else if(responseData['prefs']  == "false"){
          if (kDebugMode) {
            print( "Testing FundFox Get User Preference Value false ");
          }
          return false;
        }else{
          if (kDebugMode) {
            print( "Testing FundFox Get User Preference Value null ");
          }
          return null;
        }

      } else {
        if (kDebugMode) {
          print( "Testing FundFox Get User Preference success no :");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print( "Testing FundFox Get User Preference error : ${e.toString()}");
      }
      return null;
    }
  }

  Future<bool> setFaceRecognizationValue(bool val) async {

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userId = prefs.getString('userId').toString();
      final token = prefs.getString("token").toString();
      final uri = Uri.parse(Apis.setRegcogValue);
      final header ={
        "Authorization":"Bearer $token"
      };
      final body = {
        "user_id": userId,
        "prefs" : val.toString(),
      };


      final response = await http.post(uri, headers: header);

      if (kDebugMode) {
        print( "Testing FundFox Set User Preference FundFox : ${response.body}");
      }

      final responseData = json.decode(response.body);

      if (responseData["success"].toString() == "true") {

        if (kDebugMode) {
          print( "Testing FundFox Set User Preference success ${responseData["message"]} ");
        }
        return true;

      } else {
        if (kDebugMode) {
          print( "Testing FundFox Set User Preference no success ${responseData["message"]} ");
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print( "Testing FundFox Set User Preference error : ${e.toString()}");
      }
      return false;
    }
  }


}
