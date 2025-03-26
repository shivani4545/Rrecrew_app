// events_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/events_model.dart';
import '../service/home_service.dart';

class EventsController extends GetxController {
  final  HomeService homeService = HomeService(); // Use Get.find() for injection
  RxList<EventModel> events = <EventModel>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }

  Future<void> loadEvents() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      events.value = await homeService.getEvents();
        if (events.isNotEmpty) {

        } else {
          Get.snackbar("Info", 'No events found.',
              backgroundColor: Colors.black, colorText: Colors.white);
        }
    } catch (e) {
      errorMessage.value = 'Error loading events: ${e.toString()}';
      Get.snackbar("Error", "Error loading events: ${e.toString()}",
          backgroundColor: Colors.black, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
