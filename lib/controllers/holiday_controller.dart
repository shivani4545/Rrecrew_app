// holiday_controller.dart

import 'package:employee/models/holiday_model.dart';
import 'package:get/get.dart';

import '../service/home_service.dart';

class HolidayController extends GetxController {
  @override
  void onInit() {
    getHolidays();
    super.onInit();
  }

  HomeService homeService = HomeService();
  RxBool isLoading = false.obs;

  RxList<Holiday> holiList = <Holiday>[].obs;

  Future<void> getHolidays() async {
    try {
      isLoading.value = true;
      List<Holiday> holidays = (await homeService.getHolidays()).cast<Holiday>(); // homeService now returns List<Holiday>

      if (holidays.isNotEmpty) {
        holiList.value = holidays; // Assign the list of holidays directly
      } else {
        holiList.value = []; // Assign an empty list if holidays is empty
        print("Holidays data is empty");
      }
    } catch (e, stackTrace) {
      isLoading.value = false;
      print("Error fetching holidays: $e");
      print(stackTrace);
      Get.snackbar(
        "Error",
        "Failed to load holidays. Please try again later.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}