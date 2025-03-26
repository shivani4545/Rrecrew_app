import 'package:employee/controllers/payroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/appbar.dart';

class PayRollScreen extends StatelessWidget {
  const PayRollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PayRollController());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: "PayRoll"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Column(
                    children: [
                      DataTable(
                          columnSpacing:
                              MediaQuery.of(context).size.width * .25,
                          columns: [
                            DataColumn(
                              label: Text(
                                "Month",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .03,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito ',
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Year",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .03,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito ',
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Download",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .03,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito ',
                                ),
                              ),
                            ),
                          ],
                          rows: List.generate(
                            controller.pay.length,
                            (index) => DataRow(cells: [
                              DataCell(
                                Text(
                                  controller.pay[index].month
                                              .toString()
                                              .toString() ==
                                          "1"
                                      ? "January"
                                      : controller.pay[index].month.toString() ==
                                              "2"
                                          ? "February"
                                          : controller.pay[index].month
                                                      .toString() ==
                                                  "3"
                                              ? "March"
                                              : controller.pay[index].month
                                                          .toString() ==
                                                      "4"
                                                  ? "April"
                                                  : controller.pay[index].month
                                                              .toString() ==
                                                          "5"
                                                      ? "May"
                                                      : controller.pay[index]
                                                                  .month
                                                                  .toString() ==
                                                              "6"
                                                          ? "June"
                                                          : controller.pay[index].month
                                                                      .toString() ==
                                                                  "7"
                                                              ? "July"
                                                              : controller.pay[index]
                                                                          .month
                                                                          .toString() ==
                                                                      "8"
                                                                  ? "August"
                                                                  : controller.pay[index].month.toString() == "9"
                                                                      ? "September"
                                                                      : controller.pay[index].month.toString() == "10"
                                                                          ? "October  "
                                                                          : controller.pay[index].month.toString() == "11"
                                                                              ? "November"
                                                                              : controller.pay[index].month.toString() == "12"
                                                                                  ? "December"
                                                                                  : "--",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .03,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.pay[index].year.toString(),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .03,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              ),
                              DataCell(Center(
                                child: InkWell(
                                    onTap: () {
                                      controller.downloadFile(
                                          filename:
                                              "SalarySlip ${controller.pay[index].salaryslip.toString()}",
                                          url: controller.pay[index].salaryslip
                                              .toString());
                                    },
                                    child: const Icon(
                                        Icons.download_for_offline_outlined)),
                              )),
                            ]),
                          ))
                      // Expanded(
                      //   child: ListView.builder(
                      //     shrinkWrap: true,
                      //     physics: const ScrollPhysics(),
                      //     itemCount: controller.pay.length,
                      //     itemBuilder: (context, index) => Padding(
                      //       padding: const EdgeInsets.only(bottom: 5.0),
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10),
                      //           color: MyColors.whiteColor,
                      //           border:
                      //               Border.all(color: MyColors.darkBlueColor),
                      //         ),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(4.0),
                      //           child: Column(
                      //             children: [
                      //               Row(
                      //                 children: [
                      //                   Text(
                      //                     "Employee Name : ",
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                   Text(
                      //                     controller.pay[index].name.toString(),
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               const SizedBox(height: 15),
                      //               Row(
                      //                 children: [
                      //                   Text(
                      //                     "Mobile Number : ",
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                   Text(
                      //                     controller.pay[index].number
                      //                         .toString(),
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               const SizedBox(height: 15),
                      //               Row(
                      //                 children: [
                      //                   Text(
                      //                     "Email : ",
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                   Text(
                      //                     controller.pay[index].email
                      //                         .toString(),
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               const SizedBox(height: 15),
                      //               Row(
                      //                 children: [
                      //                   Text(
                      //                     "Company Name : ",
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     width: MediaQuery.of(context)
                      //                             .size
                      //                             .width *
                      //                         .6,
                      //                     child: Text(
                      //                       controller.pay[index].companyName
                      //                           .toString(),
                      //                       style: TextStyle(
                      //                         fontWeight: FontWeight.bold,
                      //                         color: MyColors.blackColor,
                      //                         fontSize: MediaQuery.of(context)
                      //                                 .size
                      //                                 .width *
                      //                             .035,
                      //                         fontFamily: 'Nunito',
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               const SizedBox(height: 15),
                      //               Row(
                      //                 children: [
                      //                   Text(
                      //                     "Joining Date : ",
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                   Text(
                      //                     controller.pay[index].dateOfJoining
                      //                         .toString(),
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               const SizedBox(height: 15),
                      //               Row(
                      //                 children: [
                      //                   Text(
                      //                     "Salary : ",
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                   Text(
                      //                     "₹${controller.pay[index].salary}",
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               const SizedBox(height: 15),
                      //               Row(
                      //                 children: [
                      //                   Text(
                      //                     "Month : ",
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                   Text(
                      //                     controller.pay[index].month
                      //                         .toString(),
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               const SizedBox(height: 15),
                      //               Row(
                      //                 children: [
                      //                   Text(
                      //                     "Year : ",
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                   Text(
                      //                     controller.pay[index].year.toString(),
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       color: MyColors.blackColor,
                      //                       fontSize: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           .035,
                      //                       fontFamily: 'Nunito',
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               const SizedBox(height: 15),
                      //               TextButton(
                      //                 onPressed: () {
                      //                   controller.downloadFile(
                      //                       filename: "SalarySlip",
                      //                       url:
                      //                           "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf");
                      //                 },
                      //                 style: const ButtonStyle(
                      //                     backgroundColor:
                      //                         MaterialStatePropertyAll(
                      //                             MyColors.darkBlueColor)),
                      //                 child: const Row(
                      //                   mainAxisSize: MainAxisSize.min,
                      //                   children: [
                      //                     Icon(
                      //                       Icons.download_for_offline_outlined,
                      //                       color: MyColors.whiteColor,
                      //                     ),
                      //                     SizedBox(width: 15),
                      //                     Text(
                      //                       "Download Salary Slip",
                      //                       style: TextStyle(
                      //                         color: MyColors.whiteColor,
                      //                         fontWeight: FontWeight.bold,
                      //                         fontFamily: 'Nunito',
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
