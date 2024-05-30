import 'package:eatsy_food_delivery_app_backend/models/category_model.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:flutter/material.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    super.key, required this.category
  });
  final Category category;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(category.imageUrl, height: 25,),
      title: Text(category.name, style: apptheme.headline5,),
      subtitle: Text(category.description, style: apptheme.bodyText1,),
      trailing: Icon(Icons.menu_rounded, color: apptheme.primaryColor2,),
    );
  }
}
