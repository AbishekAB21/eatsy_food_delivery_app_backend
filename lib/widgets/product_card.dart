
import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, required this.index})
      : super(key: key);

  final Product product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: apptheme.ContainerColor),
      child: (index == 0)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_outlined,
                      color: apptheme.primaryColor2,
                      size: 40,
                    )),
                Text(
                  "Add New Product",
                  style: apptheme.bodyText1,
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(product.imageUrl),
                ),
                Text(
                  product.name,
                  style: apptheme.headline5,
                ),
                Text(
                  "₹${product.price}",
                  style: apptheme.bodyText1,
                ),
              ],
            ),
    );
  }
}
