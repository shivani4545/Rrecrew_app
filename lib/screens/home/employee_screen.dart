import 'package:employee/controllers/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../widgets/appbar.dart';
import '../../widgets/textformfield.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmployeesController());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: "Employee List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormFields(
              controller: controller.searchController,
              labeltext: "Search",
              onTap: () {},
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: controller.emplist.length,
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
                                "Employee ID : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              Text(
                                controller.emplist[index].id.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "Employee Name : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              Text(
                                controller.emplist[index].name.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "Status : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              Text(
                                controller.emplist[index].status.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "Role : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .6,
                                child: Text(
                                  controller.emplist[index].roleName.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.blackColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
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
                                "Joining Date: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              Text(
                                controller.emplist[index].dateOfJoining
                                    .toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "Mobile Number : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              Text(
                                controller.emplist[index].number.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "Department : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              Text(
                                controller.emplist[index].department.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
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
    );
  }
}
