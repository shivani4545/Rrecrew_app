import 'package:employee/models/attendence_model.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import '../service/home_service.dart';

class AttendanceController extends GetxController {
  @override
  void onInit() {
    getAttendenceList(
        month: DateTime.now().month.toString(),
        year: DateTime.now().year.toString());
    super.onInit();
  }

  HomeService homeService = HomeService();


  RxBool isLoading = false.obs;
  RxString selectedMonth = ''.obs;
  RxString selectedYear = ''.obs;
  RxString selectedmonthyear = ''.obs;



  Future<String> selectMonth({required context}) async {
    try {
      final selected = await showMonthYearPicker(
        context: context,
        firstDate: DateTime(1019),
        lastDate: DateTime(9000),
        initialDate: DateTime.now(),
      );
      if (selected != null) {
        selectedmonthyear.value = "${selected.month}-${selected.year}";
        selectedMonth.value = "${selected.month}";
        selectedYear.value = "${selected.year}";
      }
      return selectedMonth.value;
    } catch (e) {
      rethrow;
    }
  }

  final attendance = Rxn<AttendanceModel>();
  getAttendenceList({
    required String year,
    required String month,
  }) async {
    try {
      isLoading.value = true;
      attendance.value =
          await homeService.getUserAttendence(month: month, year: year);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print(e);
    }
  }
}
