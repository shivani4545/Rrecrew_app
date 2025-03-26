import 'package:employee/controllers/expence_controller.dart';
import 'package:employee/screens/home/expence_claim_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../widgets/appbar.dart';

class ReumbersmentScreen extends StatelessWidget {
  const ReumbersmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExpenceController());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: "Reimbursement"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const ExpenceClaimScreen());
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MyColors.blueColor,
                            border: Border.all(color: MyColors.darkBlueColor),
                          ),
                          child: Center(
                            child: Text(
                              "Expense Claim",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.whiteColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * .035,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.explist.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.whiteColor,
                              border: Border.all(color: MyColors.darkBlueColor),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Employee : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .035,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      Text(
                                        controller.explist[index].userId
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .035,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text(
                                        "Category : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .035,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      Text(
                                        controller.explist[index].categoryTypeId
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .035,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text(
                                        "Title : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .035,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      Text(
                                        controller.explist[index].name
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .035,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text(
                                        "Description : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .035,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6,
                                        child: Text(
                                          controller.explist[index].purchaseFrom
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.blackColor,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .035,
                                            fontFamily: 'Nunito',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text(
                                        "Date of Purchase : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .035,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      Text(
                                        controller.explist[index].dateOfPurchase
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .035,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text(
                                        "Amount : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .035,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      Text(
                                        "₹${controller.explist[index].amount}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .035,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
