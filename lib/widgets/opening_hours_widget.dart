import 'package:eatsy_food_delivery_app_backend/config/responsive.dart';
import 'package:eatsy_food_delivery_app_backend/models/opening_hours.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:flutter/material.dart';

class OpeningHoursWidget extends StatelessWidget {
  final OpeningHours openinghours;
  final Function(bool?)? oncheckboxChanged;
  final Function(RangeValues)? onSliderChange;
  const OpeningHoursWidget({
    super.key,
    required this.openinghours,
    this.oncheckboxChanged,
    this.onSliderChange,
  });

  @override
  Widget build(BuildContext context) {
    double height = Responsive.isMobile(context) ? 110 : 70;
    EdgeInsets padding = Responsive.isMobile(context)
        ? EdgeInsets.all(10.0)
        : EdgeInsets.all(20.0);
    return Container(
      height: height,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      padding: padding,
      color: apptheme.secondaryColor,
      child: 
      Responsive.isMobile(context) ? 
      Column(
        children: [
          Row(
            children: [
              _buildCheckBox(),
              SizedBox(width: 10,),
              _buildText()
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: _buildSilder(context)),
          
        ],
      ):
      Row(
        children: [
          _buildCheckBox(),
          SizedBox(
            height: 10,
          ),
          Expanded(child: _buildSilder(context)),
          SizedBox(
            width: 125,
            child: openinghours.isOpen
                ? Text("Open from ${openinghours.openAt}")
                : Text("Closed on ${openinghours.day}"),
          )
        ],
      ),
    );
  }

  SizedBox _buildText() {
    return SizedBox(
          width: 125,
          child: openinghours.isOpen
              ? Text("Open from ${openinghours.openAt}")
              : Text("Closed on ${openinghours.day}"),
        );
  }

  Row _buildCheckBox() {
    return Row(
      children: [
        Checkbox(
          value: openinghours.isOpen,
          onChanged: oncheckboxChanged,
          fillColor: MaterialStateProperty.all(apptheme.secondaryColor),
          checkColor: apptheme.primaryColor2,
          activeColor: apptheme.primaryColor2,
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 100,
          child: Text(
            openinghours.day,
            style: apptheme.headline5,
          ),
        )
      ],
    );
  }

  RangeSlider _buildSilder(BuildContext context) {
    return RangeSlider(
        activeColor: apptheme.primaryColor2,
        divisions: 24,
        min: 0,
        max: 24,
        values: RangeValues(openinghours.openAt, openinghours.closeAt),
        onChanged: onSliderChange);
  }
}
