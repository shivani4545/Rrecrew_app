import 'package:camera/camera.dart';
import 'package:employee/screens/auth/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'controllers/face_recognization/face_values_controller.dart';
import 'controllers/home_controller.dart';
import 'controllers/login_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Original Bug
  // Get.put(LoginController());
  final cameras =await availableCameras();
  runApp(MyApp(cameras: cameras,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.cameras});
  final List<CameraDescription> cameras;


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      localizationsDelegates: const [MonthYearPickerLocalizations.delegate],
      title: 'Employee',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(cameras : cameras),
    );
  }
}
