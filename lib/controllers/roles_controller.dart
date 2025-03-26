import 'package:employee/models/roles_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/home_service.dart';

class RolesController extends GetxController {
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    getRoles();
    super.onInit();
  }

  HomeService homeService = HomeService();
  RxBool isLoading = false.obs;

  final roles = Rxn<RolesModel>();

  getRoles() async {
    try {
      isLoading.value = true;
      roles.value = await homeService.getAllRoles();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }
}
