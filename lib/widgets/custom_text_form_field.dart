import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final int maxlines;
  final String title;
  final bool hasTitle;
  final String initialValue;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.maxlines,
    required this.title,
    required this.hasTitle,
    required this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          hasTitle ? 
          SizedBox(
            width: 75,
            child: Text(
              title,
              style: apptheme.headline3Black,
            ),
          ): SizedBox(),
          Expanded(
            child: TextFormField(
              maxLines: maxlines,
              initialValue: initialValue,
              onChanged: onChanged,
              onEditingComplete: () {
                print("Done");
              },
              decoration: InputDecoration(
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: apptheme.primaryColor2)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: apptheme.primaryColor))),
            ),
          ),
        ],
      ),
    );
  }
}
