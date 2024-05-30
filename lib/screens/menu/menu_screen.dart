import 'package:eatsy_food_delivery_app_backend/config/responsive.dart';
import 'package:eatsy_food_delivery_app_backend/models/category_model.dart';
import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/category_list_tile.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_app_bar.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_drawer.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/product_card.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.primaryColor,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Row(
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
                      "Restaurant Menu",
                      style: apptheme.HomescreenHeading,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Product.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCard(
                            product: Product.products[index],
                            index: index,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Responsive.isWideDesktop(context) ||
                            Responsive.isDesktop(context)
                        ? Container(
                            constraints: BoxConstraints(
                              minHeight: 300,
                              maxHeight: 1000,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: _buildCategoryTile(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: _buildProductTile(),
                                )
                              ],
                            ),
                          )
                        : Column(
                          children: [
                            _buildCategoryTile(),
                            SizedBox(
                              height: 20,
                            ),
                            _buildProductTile()
                          ],
                        ),
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
      ),
    );
  }

  Container _buildProductTile() {
    return Container(
      padding: EdgeInsets.all(20),
      color: apptheme.ContainerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Products",
            style: apptheme.headline3Black,
          ),
          SizedBox(
            height: 20,
          ),
          ...Product.products.map((products) {
            return ProductListTile(
              product: products,
            );
          }).toList(),
        ],
      ),
    );
  }

  Container _buildCategoryTile() {
    return Container(
      padding: EdgeInsets.all(20),
      color: apptheme.ContainerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: apptheme.headline3Black,
          ),
          SizedBox(
            height: 20,
          ),
          ...Category.categories.map((category) {
            return CategoryListTile(category: category);
          }).toList(),
        ],
      ),
    );
  }
}
