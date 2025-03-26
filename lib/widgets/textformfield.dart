import 'package:flutter/material.dart';
import '../utils/colors.dart';

class TextFormFields extends StatelessWidget {
  final TextEditingController controller;
  final String labeltext;
  final String? validation;
  final bool? obsucure;
  final TextInputType? inputtype;
  final Icon? icon;
  final Function()? onTap;
  final Function()? onSubmit;
  final Function({required String val})? onchnaged;
  const TextFormFields(
      {super.key,
      required this.controller,
      required this.labeltext,
      this.validation,
      this.icon,
      this.obsucure,
      this.inputtype,
      this.onTap,
      this.onSubmit,
      this.onchnaged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsucure == null ? false : obsucure!,
      keyboardType: inputtype,
      onEditingComplete: onSubmit,
      onTap: onTap,
      onChanged: (value) {
        onchnaged!(val: value);
      },
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: icon,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: MyColors.blackColor),
              borderRadius: BorderRadius.circular(10.0)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.blackColor)),
          labelText: labeltext,
          labelStyle: const TextStyle(fontFamily: "Nunito")),
      validator: (value) {
        if (value!.isEmpty) {
          return validation;
        }
        return null;
      },
    );
  }
}
