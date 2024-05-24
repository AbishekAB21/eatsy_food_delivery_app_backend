import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_app_bar.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.primaryColor,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Container(),
    );
  }
}


