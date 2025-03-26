import 'package:employee/screens/auth/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/home/profile_screen.dart';
import '../utils/colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.whiteColor,
      child: Column(
        children: [
          Container(
              color: MyColors.grayColor,
              height: MediaQuery.of(context).size.height * .3,
              child: Center(
                  child: Image(
                image: const AssetImage("assets/images/logo.png"),
                height: MediaQuery.sizeOf(context).height * .15,
              ))),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.home_outlined,
                    color: MyColors.blackColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackColor,
                      fontSize: MediaQuery.of(context).size.width * .045,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          InkWell(
            onTap: () {
              Get.to(() => const ProfilrScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: MyColors.blackColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackColor,
                      fontSize: MediaQuery.of(context).size.width * .045,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          InkWell(
            onTap: () async {
              Get.defaultDialog(
                  title: "Logout !",
                  middleText: "are you sure to logout ?",
                  actions: [
                    TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(MyColors.blackColor)),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyColors.whiteColor,
                            fontSize: MediaQuery.of(context).size.width * .04,
                            fontFamily: 'Nunito',
                          ),
                        )),
                    TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(MyColors.blackColor)),
                        onPressed: () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.clear();
                          Get.offAll(() => const LoginScreen());
                        },
                        child: Text(
                          "Ok",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyColors.whiteColor,
                            fontSize: MediaQuery.of(context).size.width * .04,
                            fontFamily: 'Nunito',
                          ),
                        ))
                  ]);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.logout_outlined,
                    color: MyColors.blackColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Logout",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackColor,
                      fontSize: MediaQuery.of(context).size.width * .045,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
