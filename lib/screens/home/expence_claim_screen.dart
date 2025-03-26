import 'package:employee/controllers/expence_controller.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drop_down.dart';
import '../../widgets/textformfield.dart';

class ExpenceClaimScreen extends StatelessWidget {
  const ExpenceClaimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExpenceController());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: "Add Expense"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Form(
          key: controller.formkey,
          child: Column(
            children: [
              const SizedBox(height: 25),
              PrimaryDropDown(
                hintText: "Select Expense Type",
                items: controller.explisttype
                    .map((element) => element.name.toString())
                    .toList(),
                onChanged: (val) {
                  controller.expenceType.value = controller.explisttype
                      .where((element) => element.name == val)
                      .first
                      .id
                      .toString();
                },
              ),
              const SizedBox(height: 25),
              TextFormFields(
                controller: controller.titleController,
                labeltext: "Title",
                icon: const Icon(Icons.title),
                validation: "Please Enter Title",
              ),
              const SizedBox(height: 25),
              TextFormFields(
                controller: controller.descriptionController,
                labeltext: "Description",
                icon: const Icon(Icons.description),
                validation: "Please Enter Description",
              ),
              const SizedBox(height: 25),
              TextFormFields(
                controller: controller.amountController,
                labeltext: "Amount",
                icon: const Icon(Icons.currency_rupee),
                validation: "Please Enter Amount",
              ),
              const SizedBox(height: 25),
              TextFormFields(
                onTap: () {
                  controller.selectDate(
                      context: context, controller: controller.dateController);
                },
                controller: controller.dateController,
                labeltext: "Purchase date",
                icon: const Icon(Icons.calendar_month),
                validation: "Please Enter Email or Mobile Number",
              ),
              const SizedBox(height: 25),
              Button(
                  ontap: () {
                    if (controller.expenceType.value == "") {
                      Get.snackbar("", "Please Select Expense Type",
                          backgroundColor: MyColors.blackColor,
                          colorText: MyColors.whiteColor);
                    } else {
                      if (controller.formkey.currentState!.validate()) {
                        controller.applyexpence();
                      }
                    }
                  },
                  color: MyColors.blueColor,
                  titleColor: MyColors.whiteColor,
                  title: "Submit")
            ],
          ),
        ),
      )),
    );
  }
}
