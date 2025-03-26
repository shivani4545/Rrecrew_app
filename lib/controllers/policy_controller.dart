import 'package:employee/models/policies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/home_service.dart';

class PolicyController extends GetxController {
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    getPolicy();
    super.onInit();
  }

  HomeService homeService = HomeService();
  RxBool isLoading = false.obs;

  RxList<PoliciesModel> policyList = <PoliciesModel>[].obs;

  getPolicy() async {
    try {
      isLoading.value = true;
      policyList.value = await homeService.getPolicies();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }
}
