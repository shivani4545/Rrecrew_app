import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double? width;
  final Color color;
  final Color titleColor;
  final String title;
  final Function()? ontap;
  const Button(
      {super.key,
      this.width,
      required this.color,
      required this.titleColor,
      required this.title,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: MediaQuery.of(context).size.height * .06,
          width: width,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontFamily: 'Nunito',
              fontSize: MediaQuery.of(context).size.width * .045,
            ),
          ))),
    );
  }
}
