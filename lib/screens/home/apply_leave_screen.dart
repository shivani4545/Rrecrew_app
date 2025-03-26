import 'package:employee/utils/colors.dart';
import 'package:employee/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/leave_controller.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drop_down.dart';
import '../../widgets/textformfield.dart';

class ApplyLeaveScreen extends StatelessWidget {
  const ApplyLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LeaveController());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: "Apply Leaves"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Form(
              key: controller.formkey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  PrimaryDropDown(
                    hintText: "Select Leave Type",
                    items: const ["Sick Leave", "Casual Leave"],
                    onChanged: (val) {
                      controller.leaveType.value = val;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(children: [
                    Checkbox(
                        value: controller.ishalfDay.value,
                        onChanged: (val) {
                          controller.halfday(val: val!);
                        }),
                    Text(
                      "Half Day",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.blackColor,
                        fontSize: MediaQuery.of(context).size.width * .035,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ]),
                  const SizedBox(height: 20),
                  TextFormFields(
                    onTap: () async {
                      controller.selectDate(
                          context: context,
                          controller: controller.fromdateController);
                    },
                    controller: controller.fromdateController,
                    labeltext: "From date",
                    icon: const Icon(Icons.calendar_month),
                    validation: "Please Enter From date",
                  ),
                  const SizedBox(height: 20),
                  controller.ishalfDay.value == false
                      ? TextFormFields(
                          onTap: () async {
                            controller.selectDate(
                                context: context,
                                controller: controller.todateController);
                          },
                          controller: controller.todateController,
                          labeltext: "To date",
                          icon: const Icon(Icons.calendar_month),
                          validation: "Please Enter To date",
                        )
                      : Container(),
                  controller.ishalfDay.value == false
                      ? const SizedBox(height: 20)
                      : Container(),
                  controller.ishalfDay.value == true
                      ? TextFormFields(
                          onTap: () {
                            controller.selecttime(
                                context: context,
                                controller: controller.timeController);
                          },
                          controller: controller.timeController,
                          labeltext: "From Time",
                          icon: const Icon(Icons.calendar_month),
                          validation: "Please Select Time",
                        )
                      : Container(),
                  controller.ishalfDay.value == true
                      ? const SizedBox(height: 20)
                      : Container(),
                  controller.ishalfDay.value == true
                      ? TextFormFields(
                          onTap: () {
                            controller.selecttime(
                                context: context,
                                controller: controller.toTimeController);
                          },
                          controller: controller.toTimeController,
                          labeltext: "To Time",
                          icon: const Icon(Icons.calendar_month),
                          validation: "Please Select Time",
                        )
                      : Container(),
                  controller.ishalfDay.value == true
                      ? const SizedBox(height: 20)
                      : Container(),
                  TextFormFields(
                    controller: controller.reasonController,
                    labeltext: "Reason",
                    icon: const Icon(Icons.sd_card_sharp),
                    validation: "Please Enter Reason",
                  ),
                  const SizedBox(height: 20),
                  controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator.adaptive())
                      : Button(
                          ontap: () {
                            if (controller.leaveType.value == "") {
                              Get.snackbar("", "Please Select Leave Type",
                                  backgroundColor: MyColors.blackColor,
                                  colorText: MyColors.whiteColor);
                            } else {
                              if (controller.formkey.currentState!.validate()) {
                                controller.applyLeave();
                              }
                            }
                          },
                          color: MyColors.blueColor,
                          titleColor: MyColors.whiteColor,
                          title: "Apply")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
