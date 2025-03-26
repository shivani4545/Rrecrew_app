import 'package:employee/controllers/policy_controller.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

import '../../widgets/appbar.dart';

class ComnpniesPoliciesScreen extends StatelessWidget {
  const ComnpniesPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PolicyController());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: "Policies"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: controller.policyList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Column(
                            children: [
                              Button(
                                  color: MyColors.blueColor,
                                  titleColor: MyColors.whiteColor,
                                  title: controller.policyList[index].title
                                      .toString()),
                              Center(
                                child: HtmlWidget(controller
                                    .policyList[index].url
                                    .toString()),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      )),
    );
  }
}
