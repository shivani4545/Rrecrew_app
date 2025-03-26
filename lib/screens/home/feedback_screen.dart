import 'package:employee/controllers/feedback_controller.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/appbar.dart';
import '../../widgets/textformfield.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedBackController());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: "Feedback"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1. What is your job function?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans1Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "2.  How long have you been working for the company?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans2Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "3. Overall, how satisfied are you with the company you work for?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans3Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "4.Please rate your satisfaction with employee benefits and policies of your organization.?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans4Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "5.Do you regularly receive constructive performance feedback from your manager?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans5Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "6. How helpful has been the feedback given by your manager?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans6Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "7. What does your boss/supervisor do to keep your morale high?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans7Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "8.Do you have any suggestions to improve company/employee relations?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans8Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "9.Do you find your work engaging?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans9Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "10.Would you recommend this organization as a great place to work?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans10Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "11.Is your job in alignment with your career goals?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans11Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "12.Do you have career growth and development opportunities at this organization?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans12Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "13.Do you feel that changes are made in a way that is consistent with the company’s mission and long-term vision?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans13Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "14.When you contribute to the organization's success, do you feel recognized?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans14Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 10),
              Text(
                "15.Does your job give you the flexibility to meet the needs of your personal life?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .035,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormFields(
                icon: const Icon(Icons.message),
                controller: controller.ans15Controller,
                labeltext: "",
                validation: "",
              ),
              const SizedBox(height: 20),
              Button(
                  ontap: () {
                    controller.sendFeedback();
                  },
                  color: MyColors.blueColor,
                  titleColor: MyColors.whiteColor,
                  title: "Submit"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
