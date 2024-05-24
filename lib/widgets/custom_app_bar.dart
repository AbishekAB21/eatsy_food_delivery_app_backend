import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: apptheme.primaryColor2,
      title: Text("Your Restaurant Name", style: apptheme.UserName,),
      centerTitle: false,
      iconTheme: IconThemeData(color: apptheme.secondaryColor),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(56.0);
}