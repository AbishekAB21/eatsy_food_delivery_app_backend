import 'package:eatsy_food_delivery_app_backend/bloc/product/product_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/models/category_model.dart';
import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_drop_down.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          Product product = Product(
                              name: "",
                              category: "",
                              description: "",
                              imageUrl: "",
                              price: 0);
                          return Dialog(
                            backgroundColor: apptheme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Container(
                              height: 500,
                              width: 500,
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Add New Product",
                                    style: apptheme.healdline4,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomDropDownMenu(
                                    items: Category.categories
                                        .map((category) => category.name)
                                        .toList(),
                                    onChanged: (value) {
                                      product =
                                          product.copyWith(category: value);
                                      print(product);
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFormField(
                                    maxlines: 1,
                                    title: "Name",
                                    hasTitle: true,
                                    initialValue: "",
                                    borderColor: apptheme.ShadowColor,
                                    onChanged: (value) {
                                      product = product.copyWith(name: value);
                                    },
                                  ),
                                  CustomTextFormField(
                                    maxlines: 1,
                                    title: "Price",
                                    hasTitle: true,
                                    initialValue: "",
                                    onChanged: (value) {
                                      product = product.copyWith(
                                          price: double.parse(value));
                                    },
                                  ),
                                  CustomTextFormField(
                                    maxlines: 1,
                                    title: "Image URL",
                                    hasTitle: true,
                                    initialValue: "",
                                    onChanged: (value) {
                                      product =
                                          product.copyWith(imageUrl: value);
                                    },
                                  ),
                                  CustomTextFormField(
                                    maxlines: 3,
                                    title: "Description",
                                    hasTitle: true,
                                    initialValue: "",
                                    onChanged: (value) {
                                      product =
                                          product.copyWith(description: value);
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    apptheme.primaryColor2)),
                                        onPressed: () {
                                          /* 
                                         Here we used blocProvider to access the ProductBloc,
                                         then we added a new event to the ProductBloc
                                         then using the AddProduct event we passed the newly created
                                         product as an input.
                                         */
                                          BlocProvider.of<ProductBloc>(context)
                                              .add(
                                                  AddProduct(product: product));
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Add Product",
                                          style: apptheme.ButtonText3,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
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
