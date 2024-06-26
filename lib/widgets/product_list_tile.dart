import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key, required this.product, required this.onTap,
  });
  final Product product;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl),),
      title: Text(product.name, style: apptheme.headline5,),
      subtitle: Text(product.description, style: apptheme.bodyText1,),
      // trailing: Icon(Icons.menu_rounded, color: apptheme.primaryColor2,),
    );
  }
}
