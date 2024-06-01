import 'package:eatsy_food_delivery_app_backend/config/responsive.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  const CustomLayout({super.key, required this.title, required this.widgets});

  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: apptheme.HomescreenHeading,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    ...widgets,
                    

                        SizedBox(height: 20,),
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(minHeight: 74),
                          color: apptheme.primaryColor2,
                          child: Center(
                            child: Text("Some ads here"),
                          ),
                        )
                  ],
                ),
              ),
            ),
          ),
          Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
              ? Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20, right: 20),
                    color: apptheme.secondaryColor,
                    child: Center(child: Text("Show some ads here")),
                  ),
                )
              : const SizedBox()
        ],
      );
  }
}