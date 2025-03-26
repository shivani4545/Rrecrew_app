// holiday_screen.dart

import 'package:employee/controllers/holiday_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/appbar.dart';

class HolidayScreen extends StatelessWidget {
  const HolidayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HolidayController());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: "Holidays"),
      ),
      body: SafeArea(
          child: Obx(
                () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator.adaptive())
                : Column(children: [
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        "Holiday",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .031,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito ',
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "From Date",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .031,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito ',
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "To Date",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .031,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito ',
                        ),
                      ),
                    ),
                  ],
                  rows: controller.holiList.map((holiday) => DataRow(
                    cells: [
                      DataCell(
                        Text(
                          holiday.name.toString(),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .028,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          holiday.dateFrom.toString(),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .028,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          holiday.dateTo.toString(),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .028,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                    ],
                  )).toList(),
                ),
              ),
            ]),
          )),
    );
  }
}