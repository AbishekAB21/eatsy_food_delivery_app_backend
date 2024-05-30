import 'package:eatsy_food_delivery_app_backend/models/category_model.dart';
import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_app_bar.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_drawer.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                    Container(
                      constraints: BoxConstraints(
                        minHeight: 300,
                        maxHeight: 1000,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              color: apptheme.ContainerColor,
                              child: Column(
                                children: [
                                  Text("Categories", style: apptheme.headline3Black,),
                                  SizedBox(height: 20,),
                                  ...Category.categories.map((category) {
                                    return ListTile(
                                      leading: Image.asset(category.imageUrl, height: 25,),
                                      title: Text(category.name, style: apptheme.headline5,),
                                      subtitle: Text(category.description, style: apptheme.bodyText1,),
                                      trailing: Icon(Icons.menu_rounded, color: apptheme.primaryColor2,),
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                           Expanded(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              color: apptheme.ContainerColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, right: 20),
              color: apptheme.secondaryColor,
              child: Center(child: Text("Show some ads here")),
            ),
          )
        ],
      ),
    );
  }
}
