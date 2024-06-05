import 'package:eatsy_food_delivery_app_backend/bloc/category/category_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/bloc/product/product_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/bloc/settings/settings_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/models/category_model.dart';
import 'package:eatsy_food_delivery_app_backend/models/opening_hours.dart';
import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:eatsy_food_delivery_app_backend/models/restaurant_model.dart';
import 'package:eatsy_food_delivery_app_backend/screens/menu/menu_screen.dart';
import 'package:eatsy_food_delivery_app_backend/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SettingsBloc()
              ..add(LoadSettings(Restaurant(
                null,
                null,
                null,
                null,
                null,
                Category.categories,
                Product.products,
                OpeningHours.openingHoursList,
              )))),
        BlocProvider(
          create: (context) => CategoryBloc()
            ..add(LoadCategories(categories: Category.categories)),
        ),
        BlocProvider(
            create: (context) => ProductBloc(
                  categoryBloc: BlocProvider.of<CategoryBloc>(context),
                )..add(LoadProducts(products: Product.products)))
      ],
      child: MaterialApp(
        title: "Eatsy Food Delivery App Backend",
        initialRoute: '/menu',
        debugShowCheckedModeBanner: false,
        routes: {
          '/menu': (context) => MenuScreen(),
          // '/dash' :(context) => DashboardScreen(),
          '/settings': (context) => SettingsScreen(),
        },
      ),
    );
  }
}
