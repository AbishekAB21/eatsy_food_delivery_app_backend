import 'package:eatsy_food_delivery_app_backend/screens/menu/menu_screen.dart';
import 'package:eatsy_food_delivery_app_backend/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Eatsy Food Delivery App Backend",
      initialRoute: '/menu',
      debugShowCheckedModeBanner: false,
      routes: {
        '/menu' :(context) => MenuScreen(),
        // '/dash' :(context) => DashboardScreen(),
         '/settings' :(context) => SettingsScreen(),
      },
    );
  }
}