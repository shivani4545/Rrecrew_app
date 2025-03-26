import 'package:employee/models/payrol_model.dart';
import 'package:employee/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/home_service.dart';

class PayRollController extends GetxController {
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    getPayRoll();
    super.onInit();
  }

  HomeService homeService = HomeService();
  RxBool isLoading = false.obs;

  RxList<PayRollModel> pay = <PayRollModel>[].obs;

  getPayRoll() async {
    try {
      isLoading.value = true;
      pay.value = await homeService.getPayRoll();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }

  downloadFile({
    required String filename,
    required String url,
  }) {
    // print(url);
    // FileDownloader.downloadFile(
    //     url: url,
    //     name: filename,
    //     onProgress: (String? fileName, double progress) {
    //       // print('FILE fileName HAS PROGRESS $progress');
    //     },
    //     onDownloadCompleted: (String path) {
    //       Get.snackbar("", "Success ! Check Your $path",
    //           backgroundColor: MyColors.blackColor,
    //           duration: const Duration(seconds: 10),
    //           colorText: MyColors.whiteColor);
    //     },
    //     onDownloadError: (String error) {
    //       // print('DOWNLOAD ERROR: $error');
    //     });
  }
}
