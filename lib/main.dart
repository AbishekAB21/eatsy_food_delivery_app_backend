import 'package:eatsy_food_delivery_app_backend/bloc/category/category_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/bloc/product/product_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/bloc/settings/settings_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/firebase_options.dart';
import 'package:eatsy_food_delivery_app_backend/models/category_model.dart';
import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:eatsy_food_delivery_app_backend/repository/restaurant/restaurant_repo.dart';
import 'package:eatsy_food_delivery_app_backend/screens/menu/menu_screen.dart';
import 'package:eatsy_food_delivery_app_backend/screens/settings/settings_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RestaurantRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => SettingsBloc(
                  restaurantRepository: context.read<RestaurantRepository>())
                ..add(LoadSettings())),
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
      ),
    );
  }
}
