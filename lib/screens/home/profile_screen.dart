import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../utils/colors.dart';

class ProfilrScreen extends StatelessWidget {
  const ProfilrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        elevation: 0,
        iconTheme: const IconThemeData(color: MyColors.whiteColor),
        backgroundColor: MyColors.darkBlueColor,
        // actions: [
        //   IconButton(
        //       onPressed: (){
        //         //controller.selectDate(context);
        //       },
        //       icon: Icon(Icons.edit))
        // ],
        title: Image(
          image: const AssetImage("assets/images/logo.png"),
          height: MediaQuery.of(context).size.height * .09,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: MyColors.whiteColor,
            //     border: Border.all(color: MyColors.blackColor),
            //   ),
            //   width: double.infinity,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       // Text(
            //       //   controller.user.value == null
            //       //       ? "--"
            //       //       : controller.user.value!.details!.fullName == "null"
            //       //           ? "--"
            //       //           : controller.user.value!.details!.fullName.toString(),
            //       //   style: TextStyle(
            //       //     fontSize: MediaQuery.of(context).size.width * .045,
            //       //     fontFamily: 'Nunito ',
            //       //   ),
            //       // ),
            //       // const SizedBox(height: 5),
            //       Text(
            //         "Personal Details : ${controller.user.value == null ? "--" : controller.user.value!.details!.department == "null" ? "--" : controller.user.value!.details!.department.toString()}",
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width * .04,
            //           fontFamily: 'Nunito',
            //         ),
            //       ),
            //       Text(
            //         " name: ${controller.user.value == null ? "--" : controller.user.value!.details!.fullName == null || controller.user.value!.details!.fullName == "null" ? "--" : controller.user.value!.details!.fullName.toString()}",
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width * .04,
            //           fontFamily: 'Nunito',
            //         ),
            //       ),
            //       const SizedBox(height: 5),
            //       Text(
            //         "WorkEmail: ${controller.user.value == null ? "--" : controller.user.value!.details!.workEmail == null || controller.user.value!.details!.workEmail == "null" ? "--" : controller.user.value!.details!.workEmail.toString()}",
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width * .04,
            //           fontFamily: 'Nunito',
            //         ),
            //       ),
            //       const SizedBox(height: 5),
            //       Text(
            //         "Work Mobile: ${controller.user.value == null ? "--" : controller.user.value!.details!.workMobile == null || controller.user.value!.details!.workMobile == "null" ? "--" : controller.user.value!.details!.workMobile.toString()}",
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width * .04,
            //           fontFamily: 'Nunito',
            //         ),
            //       ),
            //       const SizedBox(height: 5),
            //
            //       Text(
            //         "local Address: ${controller.user.value == null ? "--" : controller.user.value!.details!.localAddress == null || controller.user.value!.details!.localAddress == "null" ? "--" : controller.user.value!.details!.localAddress.toString()}",
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width * .04,
            //           fontFamily: 'Nunito',
            //         ),
            //       ),
            //       const SizedBox(height: 5),
            //       // const SizedBox(height: 5),
            //       // Text(
            //       //   "Employee ID: ${controller.user.value!.details!.code.toString()}",
            //       //   style: TextStyle(
            //       //     fontSize: MediaQuery.of(context).size.width * .04,
            //       //     fontFamily: 'Nunito',
            //       //   ),
            //       // ),
            //       const SizedBox(height: 5),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.whiteColor,
                border: Border.all(color: MyColors.blackColor),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(10), // Add padding around the content
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Personal Details",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontFamily: 'Nunito ',
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // controller.selectDate(context);
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
              Text(
                        "Name: ${controller.user.value == null ? "--" : controller.user.value!.details!.fullName == null || controller.user.value!.details!.fullName == "null" ? "--" : controller.user.value!.details!.fullName.toString()}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .04,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "WorkEmail: ${controller.user.value == null ? "--" : controller.user.value!.details!.workEmail == null || controller.user.value!.details!.workEmail == "null" ? "--" : controller.user.value!.details!.workEmail.toString()}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .04,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Work Mobile: ${controller.user.value == null ? "--" : controller.user.value!.details!.workMobile == null || controller.user.value!.details!.workMobile == "null" ? "--" : controller.user.value!.details!.workMobile.toString()}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .04,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      const SizedBox(height: 5),

                      Text(
                        "local Address: ${controller.user.value == null ? "--" : controller.user.value!.details!.localAddress == null || controller.user.value!.details!.localAddress == "null" ? "--" : controller.user.value!.details!.localAddress.toString()}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .04,
                          fontFamily: 'Nunito',
                        ),
                      ),
                //       const SizedBox(height: 5),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.whiteColor,
                border: Border.all(color: MyColors.blackColor),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(10), // Add padding around the content
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Employment Details",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontFamily: 'Nunito ',
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     // controller.selectDate(context);
                      //   },
                      //   icon: Icon(Icons.edit),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Division : ${controller.user.value == null ? "--" : controller.user.value!.details!.division == null || controller.user.value!.details!.division == "null" ? "--" : controller.user.value!.details!.division.toString()}",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .04,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Department : ${controller.user.value == null ? "--" : controller.user.value!.details!.department == null || controller.user.value!.details!.department == "null" ? "--" : controller.user.value!.details!.department.toString()}",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .04,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Text(
                  //   "Designation : ${controller.user.value == null ? "--" : controller.user.value!.details!.userId == null ? "--" : controller.user.value!.details!.userId.toString()}",
                  //   style: TextStyle(
                  //     fontSize: MediaQuery.of(context).size.width * .04,
                  //     fontFamily: 'Nunito',
                  //   ),
                  // ),
                  // const SizedBox(height: 5),
                  Text(
                    "Designation : ${controller.user.value == null ? "--" : controller.user.value!.details!.designation == null ? "--" : controller.user.value!.details!.designation.toString()}",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .04,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Text(
                  //   "Date Joined : ${controller.user.value == null ? "--" : controller.user.value!.details!.dateOfJoining == null ? "--" : controller.user.value!.details!.dateOfJoining.toString()}",
                  //   style: TextStyle(
                  //     fontSize: MediaQuery.of(context).size.width * .04,
                  //     fontFamily: 'Nunito',
                  //   ),
                  // ),
                  // const SizedBox(height: 5),
                  // Text(
                  //   "Date Confirmed :	${controller.user.value == null ? "--" : controller.user.value!.details!.dateOfConfirmation == null ? "--" : controller.user.value!.details!.dateOfConfirmation.toString()}",
                  //   style: TextStyle(
                  //     fontSize: MediaQuery.of(context).size.width * .04,
                  //     fontFamily: 'Nunito',
                  //   ),
                  // ),
                  // const SizedBox(height: 5),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: MyColors.whiteColor,
            //     border: Border.all(color: MyColors.blackColor),
            //   ),
            //   width: double.infinity,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Text(
            //         "Bank Details",
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width * .045,
            //           fontFamily: 'Nunito ',
            //         ),
            //       ),
            //       const SizedBox(height: 5),
            //       Text(
            //         "Account Number :	${controller.user.value == null ? "--" : controller.user.value!.details!.accountNumber == null ? "--" : controller.user.value!.details!.accountNumber.toString()}",
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width * .04,
            //           fontFamily: 'Nunito',
            //         ),
            //       ),
            //       const SizedBox(height: 5),
            //       Text(
            //         "Pf Account Number :	${controller.user.value == null ? "--" : controller.user.value!.details!.pfAccountNumber == null ? "--" : controller.user.value!.details!.pfAccountNumber.toString()}",
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width * .04,
            //           fontFamily: 'Nunito',
            //         ),
            //       ),
            //       const SizedBox(height: 5),
            //       Text(
            //         "Bank Name :	${controller.user.value == null ? "--" : controller.user.value!.details!.bankName == null ? "--" : controller.user.value!.details!.bankName.toString()}",
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width * .04,
            //           fontFamily: 'Nunito',
            //         ),
            //       ),
            //       const SizedBox(height: 5),
            //       Text(
            //         "IFSC Code :	${controller.user.value == null ? "--" : controller.user.value!.details!.ifscCode == null ? "--" : controller.user.value!.details!.ifscCode.toString()}",
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width * .04,
            //           fontFamily: 'Nunito',
            //         ),
            //       ),
            //       const SizedBox(height: 5),
            //     ],
            //   ),
            // )
          ],
        ),
      )),
    );
  }
}
