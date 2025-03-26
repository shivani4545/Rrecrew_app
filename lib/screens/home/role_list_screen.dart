import 'package:employee/controllers/roles_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../widgets/appbar.dart';

class RoleListScreen extends StatelessWidget {
  const RoleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RolesController());
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: MyAppBaar(title: "Roles"),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator.adaptive())
                : Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ID",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyColors.blackColor,
                            fontSize: MediaQuery.of(context).size.width * .03,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        Text(
                          "Role",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyColors.blackColor,
                            fontSize: MediaQuery.of(context).size.width * .03,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.roles.value!.roles!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.roles.value!.roles![index].id
                                  .toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.blackColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * .03,
                                fontFamily: 'Nunito',
                              ),
                            ),
                            Text(
                              controller.roles.value!.roles![index].roleName
                                  .toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.blackColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * .03,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
          ),
        )));
  }
}
