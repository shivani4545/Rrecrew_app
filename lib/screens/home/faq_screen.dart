// import 'package:employee/controllers/faq_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../widgets/appbar.dart';
//
// class FaqScreen extends StatelessWidget {
//   const FaqScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(FaqController());
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(70),
//         child: MyAppBaar(title: "FAQ's"),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Obx(
//           () => Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   physics: const ScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: controller.faqlist.length,
//                   itemBuilder: (context, index) => Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             controller.faqlist[index].que.toString(),
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize:
//                                   MediaQuery.of(context).size.width * .045,
//                               fontFamily: 'Nunito ',
//                             ),
//                           ),
//                           Text(
//                             controller.faqlist[index].ans.toString(),
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize:
//                                   MediaQuery.of(context).size.width * .045,
//                               fontFamily: 'Nunito',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
