import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LinkWidget extends StatelessWidget {
  final String name;
  final String imagename;
  final Function()? ontap;
  const LinkWidget(
      {super.key, required this.name, required this.imagename, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .44,
        child: Card(
          elevation: 5,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: BorderSide(
              color: Colors.grey.shade100,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage(imagename),
                  height: MediaQuery.sizeOf(context).height * .045,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.blackColor,
                    fontSize: MediaQuery.of(context).size.width * .03,
                    fontFamily: 'Nunito',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
