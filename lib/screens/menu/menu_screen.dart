import 'package:eatsy_food_delivery_app_backend/bloc/category/category_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/bloc/product/product_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/config/responsive.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/category_list_tile.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_app_bar.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_drawer.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_layout.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/product_card.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.primaryColor,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: CustomLayout(
        title: "Restaurant Menu",
        widgets: [
          _buildProductSection(),
          SizedBox(height: 20),
          Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
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
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildProductTile(),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    _buildCategoryTile(),
                    SizedBox(height: 20),
                    _buildProductTile(),
                  ],
                ),
        ],
      ),
    );
  }

  BlocBuilder<ProductBloc, ProductState> _buildProductSection() {
    return BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if(state is ProductLoading){
              return CircularProgressIndicator(color: apptheme.primaryColor2,);
            }
            if(state is ProductLoaded)
            {return Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    product: state.products[index],
                    index: index,
                  );
                },
              ),
            );}
            else{
              return Text("Something went wrong");
            }
          },
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
          SizedBox(height: 20),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return CircularProgressIndicator(
                  color: apptheme.primaryColor2,
                );
              }

              if (state is ProductLoaded) {
                return ReorderableListView(
                    shrinkWrap: true,
                    children: [
                      for (int index = 0;
                          index < state.products.length;
                          index++,)
                        ProductListTile(
                          product: state.products[index],
                          onTap: () {},
                          key: ValueKey(state.products[index].id),
                        ),
                    ],
                    onReorder: ((oldIndex, newIndex) {
                      context.read<ProductBloc>().add(
                          SortProducts(oldIndex: oldIndex, newIndex: newIndex));
                    }));
                // );
              } else {
                return Text("Something went wrong");
              }
            },
          ),
          // ...Product.products.map((products) {
          //   return ProductListTile(
          //     product: products,
          //   );
          // }).toList(),
        ],
      ),
    );
  }

  Container _buildCategoryTile() {
    return Container(
      padding: EdgeInsets.all(20),
      color: apptheme.ContainerColor,
      child: Column(
        children: [
          Text("Categories", style: apptheme.headline3Black),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return CircularProgressIndicator(
                  color: apptheme.primaryColor2,
                );
              }

              if (state is CategoryLoaded) {
                return ReorderableListView(
                    shrinkWrap: true,
                    children: [
                      for (int index = 0;
                          index < state.categories.length;
                          index++,)
                        CategoryListTile(
                          category: state.categories[index],
                          onTap: () {
                            context
                                .read<CategoryBloc>()
                                .add(SelectCategory(state.categories[index]));
                          },
                          key: ValueKey(state.categories[index].id),
                        ),
                    ],
                    onReorder: ((oldIndex, newIndex) {
                      context.read<CategoryBloc>().add(
                          Sortcategory(oldIndex: oldIndex, newIndex: newIndex));
                    }));
                // );
              } else {
                return Text("Something went wrong");
              }
            },
          ),
        ],
      ),
    );
  }
}
