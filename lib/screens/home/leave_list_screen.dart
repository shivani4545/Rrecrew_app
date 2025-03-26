import 'package:employee/controllers/leave_controller.dart';
import 'package:employee/screens/home/apply_leave_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/appbar.dart';

class LeaveListScreen extends StatelessWidget {
  const LeaveListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LeaveController());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: "My Leaves"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : controller.leave.value!.leaves == null
                      ? Center(
                          child: Text(
                            "Leaves Not Available",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .03,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Get.to(() => const ApplyLeaveScreen());
                                },
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        MyColors.darkBlueColor)),
                                child: const Text(
                                  "Apply Leave",
                                  style: TextStyle(
                                    color: MyColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "Pending Casual Leave : ",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            .032,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                                Text(
                                  controller.leave.value!.pendingCasual
                                      .toString(),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            .032,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito ',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "Pending Sick Leave : ",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            .032,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                                Text(
                                  controller.leave.value!.pendingSick
                                      .toString(),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            .032,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito ',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            DataTable(
                                columnSpacing:
                                    MediaQuery.of(context).size.width * .16,
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      "From Date",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .035,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito ',
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "To Date",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .035,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito ',
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Status",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .035,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito ',
                                      ),
                                    ),
                                  ),
                                ],
                                rows: List.generate(
                                  controller.leave.value!.leaves!.length,
                                  (index) => DataRow(cells: [
                                    DataCell(
                                      Text(
                                        controller.leave.value!.leaves![index]
                                            .dateFrom
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .03,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        controller
                                            .leave.value!.leaves![index].dateTo
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .03,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        controller.leave.value!.leaves![index]
                                                    .status
                                                    .toString() ==
                                                "0"
                                            ? "Not Approved"
                                            : "Approved",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .03,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                  ]),
                                ))
                          ],
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
