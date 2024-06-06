import 'package:eatsy_food_delivery_app_backend/models/category_model.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  final List<String> items;
  final Function(String?)? onChanged;
  const CustomDropDownMenu({
    super.key, required this.items, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            "Category",
            style: apptheme.headline3Black,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: DropdownButtonFormField(
              items: items
                  .map((item) =>
                      DropdownMenuItem<String>(
                        value: item,
                          child:
                              Text(item)))
                  .toList(),
              onChanged: onChanged,
              iconSize: 20,
            ),
          ),
        )
      ],
    );
  }
}