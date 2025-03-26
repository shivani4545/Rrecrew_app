// import 'package:employee/models/faqs_model.dart';
// import 'package:get/get.dart';
// import '../service/home_service.dart';
//
// class FaqController extends GetxController {
//   @override
//   void onInit() {
//     getFaqs();
//     super.onInit();
//   }
//
//   HomeService homeService = HomeService();
//   RxBool isLoading = false.obs;
//
//   RxList<FaqsModel> faqlist = <FaqsModel>[].obs;
//
//   getFaqs() async {
//     try {
//       isLoading.value = true;
//       faqlist.value = await homeService.getAllFaqs();
//       // print(faqlist.length);
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//       // print(e);
//     }
//   }
// }
