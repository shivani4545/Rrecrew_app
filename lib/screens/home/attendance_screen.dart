import 'package:employee/controllers/attendence_controller.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AttendanceController());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: "My Attendance"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectMonth(context: context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: MyColors.blackColor),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.selectedmonthyear.value == ""
                                    ? "select Month"
                                    : controller.selectedmonthyear.value,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            controller.getAttendenceList(
                                month: controller.selectedMonth.toString(),
                                year: controller.selectedYear.toString());
                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  MyColors.darkBlueColor)),
                          child: const Text(
                            "Search",
                            style: TextStyle(
                              color: MyColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    DataTable(
                        columnSpacing: MediaQuery.of(context).size.width * .18,
                        columns: const [
                          DataColumn(
                            label: Text(
                              "Date",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "In Time",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Out Time",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                        ],
                        rows: controller.attendance.value!.attendances == null
                            ? []
                            : List.generate(
                                controller
                                    .attendance.value!.attendances!.length,
                                (index) => DataRow(cells: [
                                  DataCell(
                                    Text(
                                      controller.attendance.value!
                                                  .attendances![index].date ==
                                              null
                                          ? "--"
                                          : controller.attendance.value!
                                              .attendances![index].date
                                              .toString(),
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .028,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      controller
                                                  .attendance
                                                  .value!
                                                  .attendances![index]
                                                  .clockIn ==
                                              null
                                          ? "--"
                                          : controller.attendance.value!
                                              .attendances![index].clockIn
                                              .toString(),
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .028,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      controller
                                                  .attendance
                                                  .value!
                                                  .attendances![index]
                                                  .clockOut ==
                                              null
                                          ? "--"
                                          : controller.attendance.value!
                                              .attendances![index].clockOut
                                              .toString(),
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .028,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                  ),
                                ]),
                              )),
                  ],
                ),
        ),
      )),
    );
  }
}
