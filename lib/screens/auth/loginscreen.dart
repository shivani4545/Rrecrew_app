import 'package:employee/utils/colors.dart';
import 'package:employee/widgets/button.dart';
import 'package:employee/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Form(
          key: controller.formkey,
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  Text(
                    "Welcome To Rrecrew ",
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: MediaQuery.of(context).size.width * .062,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Login Now",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: MediaQuery.of(context).size.width * .052,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: const Image(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  TextFormFields(
                    icon: const Icon(Icons.email,color:(Color(0xffe30613))),
                    controller: controller.usernameController,
                    labeltext: "MobileNumber / Email Address",
                    validation: "Please Enter Email or Mobile Number",
                  ),
                  const SizedBox(height: 20),
                  TextFormFields(
                    obsucure: true,
                    controller: controller.passwordController,
                    labeltext: "Password",
                    icon: const Icon(Icons.lock,color: Color(0xffe30613),),
                    validation: "Please Enter Password",
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  controller.isLoading.value == true
                      ? Container(
                          height: MediaQuery.of(context).size.height * .06,
                          color: MyColors.reColor,
                          width: double.infinity,
                          child: const Center(
                              child: CircularProgressIndicator.adaptive(
                            backgroundColor: MyColors.whiteColor,
                          )))
                      : Button(
                          ontap: () {
                            if (controller.formkey.currentState!.validate()) {
                              controller.loginUser(
                                  emial:
                                      controller.usernameController.text.trim(),
                                  password: controller.passwordController.text
                                      .trim());
                            }
                          },
                          title: "Login",
                          color: MyColors.reColor ,
                          titleColor: MyColors.whiteColor,
                        )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
