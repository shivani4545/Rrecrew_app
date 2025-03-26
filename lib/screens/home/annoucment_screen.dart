import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/appbar.dart';

class AnnoucmentScreen extends StatelessWidget {
  const AnnoucmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBaar(title: " Announcment"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const Icon(Icons.mic_none_sharp),
                  const SizedBox(height: 5),
                  Text(
                    "The costs of cleaning work areas and repairing equipment, such as computers, are tax-deductible.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackColor,
                      fontSize: MediaQuery.of(context).size.width * .04,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
