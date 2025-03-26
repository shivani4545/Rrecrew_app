import 'package:employee/utils/colors.dart';
import 'package:flutter/material.dart';

class PrimaryDropDown extends StatelessWidget {
  const PrimaryDropDown({
    Key? key,
    required this.items,
    this.dropDownItem,
    this.value,
    required this.onChanged,
    this.height,
    this.inputWithLabel = false,
    this.isImp = false,
    this.isError = false,
    this.labelText,
    this.hintText,
  }) : super(key: key);

  final bool inputWithLabel;
  final double? height;
  final bool isImp;
  final String? labelText;
  final String? hintText;
  final Object? value;
  final bool isError;
  final List<String> items;
  final Function(String newValue) onChanged;
  final List<DropdownMenuItem<dynamic>>? dropDownItem;
  @override
  Widget build(BuildContext context) {
    DropdownButtonFormField dropDownFormField = DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.darkBlueColor),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.darkBlueColor),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      isExpanded: true,
      value: value,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black,
      ),
      items: dropDownItem ??
          items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.replaceAll('_', ' '),
                  style: TextStyle(
                    fontSize: (17),
                    color: Theme.of(context).colorScheme.primary,
                  )),
            );
          }).toList(),
      hint: Text(
        hintText ?? labelText ?? '',
        style: const TextStyle(
          color: Colors.black,
          fontSize: (14),
          fontFamily: 'Nunito',
        ),
      ),
      onChanged: (s) => onChanged(s),
    );
    return Container(
      color: MyColors.whiteColor,
      height: 60,
      width: double.infinity,
      child: inputWithLabel
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        labelText!,
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (isImp)
                        const Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ),
                dropDownFormField
              ],
            )
          : dropDownFormField,
    );
  }
}
