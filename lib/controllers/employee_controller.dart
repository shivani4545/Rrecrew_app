import 'package:employee/models/employees_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/home_service.dart';

class EmployeesController extends GetxController {
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    getAllEmp();
    super.onInit();
  }

  HomeService homeService = HomeService();
  RxBool isLoading = false.obs;

  RxList<EmployeesModel> emplist = <EmployeesModel>[].obs;

  getAllEmp() async {
    try {
      isLoading.value = true;
      emplist.value = await homeService.getAllEmployees();
      // print(emplist.length);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }
}
