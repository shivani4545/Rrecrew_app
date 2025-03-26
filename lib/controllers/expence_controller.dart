import 'package:employee/models/expence_type_model.dart';
import 'package:employee/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/expence_model.dart';
import '../service/home_service.dart';

class ExpenceController extends GetxController {
  @override
  void onInit() {
    getexp();
    getexptype();
    super.onInit();
  }

  final formkey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController recieptnameController = TextEditingController();

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

  RxBool isLoading = false.obs;
  HomeService homeService = HomeService();
  RxList<ExpenceModel> explist = <ExpenceModel>[].obs;

  getexp() async {
    try {
      isLoading.value = true;
      explist.value = await homeService.getExpence();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }

  RxList<ExpenceTypeModel> explisttype = <ExpenceTypeModel>[].obs;
  getexptype() async {
    try {
      isLoading.value = true;
      explisttype.value = await homeService.getExpenceType();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }

  RxString expenceType = "".obs;
  RxBool isApplied = false.obs;
  applyexpence() async {
    try {
      isLoading.value = true;
      isApplied.value = await homeService.addExpence(
          type: expenceType.value,
          title: titleController.text,
          des: descriptionController.text,
          amount: amountController.text,
          date: dateController.text);
      if (isApplied.value == true) {
        Get.delete<ExpenceController>();
        Get.put(ExpenceController().getexp());
        Get.off(() => HomeScreen());
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }
}
