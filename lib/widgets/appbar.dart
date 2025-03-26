import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MyAppBaar extends StatelessWidget {
  final String title;
  const MyAppBaar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: MyColors.whiteColor),
      backgroundColor: MyColors.darkBlueColor,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: MyColors.whiteColor,
          fontFamily: 'Nunito',
        ),
      ),
    );
  }
}
