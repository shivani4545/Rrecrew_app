import 'package:employee/models/leave_model.dart';
import 'package:employee/screens/home/leave_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/home_service.dart';

class LeaveController extends GetxController {
  @override
  void onInit() {
    getLeaveList();
    super.onInit();
  }

  final formkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString leaveType = "".obs;
  HomeService homeService = HomeService();
  TextEditingController fromdateController = TextEditingController();
  TextEditingController todateController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController toTimeController = TextEditingController();
  TextEditingController timefromController = TextEditingController();

  Future<String> selectDate(
      {required context, required TextEditingController controller}) async {
    try {
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(9000));
      if (pickedDate != null) {
        controller.text =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      }
      return controller.text;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> selecttime(
      {required context, required TextEditingController controller}) async {
    try {
      TimeOfDay? pickedTime = await showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
      );
      if (pickedTime != null) {
        controller.text = "${pickedTime.hour}:${pickedTime.minute}:00";
      }
      return controller.text;
    } catch (e) {
      rethrow;
    }
  }

  final leave = Rxn<LeaveModel>();
  getLeaveList() async {
    try {
      isLoading.value = true;
      leave.value = await homeService.getUserLeave();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }

  RxBool ishalfDay = false.obs;

  halfday({required bool val}) {
    ishalfDay.value = val;
  }

  RxBool isApplied = false.obs;
  applyLeave() async {
    try {
      isLoading.value = true;
      isApplied.value = await homeService.applyLeave(
          toTime: toTimeController.text.trim(),
          type: leaveType.value == "Sick Leave" ? "1" : "2",
          fromDate: fromdateController.text,
          reason: reasonController.text,
          fromtime: timefromController.text,
          toDate: todateController.text);
      if (isApplied.value == true) {
        Get.delete<LeaveController>();
        Get.put(LeaveController().getLeaveList());
        Get.off(() => const LeaveListScreen());
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }
}
