import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_app_bar.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_drawer.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/product_card.dart';
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
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          
                          return ProductCard(product: Product.products[index], index: index,);
                        },),
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
