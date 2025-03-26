import 'package:employee/screens/home/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseApi {
  final _firemesaging = FirebaseMessaging.instance;

  Future<void> messageHandle({required RemoteMessage message}) async {
    try {
      // print(message.notification!.title);
    } catch (e) {
      //
    }
  }

  Future<void> initialzeNotification() async {
    try {
      await _firemesaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      final fcmToken = await _firemesaging.getToken();
      debugPrint(fcmToken);
      FirebaseMessaging.onBackgroundMessage((message) async {
        if (message.contentAvailable == true) {
          messageHandle(message: message);
        }
      });
      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        Get.to(() => HomeScreen());
      });
    } catch (e) {
      // print(e);
    }
  }
}
