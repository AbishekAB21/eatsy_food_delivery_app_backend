import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> screens = {
      'Dashboard': {
        'routename': '/dash',
        'icon': const Icon(Icons.dashboard),
      },
      'Menu': {
        'routename': '/menu',
        'icon': const Icon(Icons.menu_book_rounded),
      },
      'Settings': {
        'routename': '/settings',
        'icon': const Icon(Icons.settings_rounded),
      },
      'Logout': {
        'routename': '/logout',
        'icon': const Icon(Icons.logout_rounded),
      },
    };
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 65,
            child: DrawerHeader(
                decoration: BoxDecoration(color: apptheme.primaryColor2),
                child: Text(
                  "Your Restaurant Name",
                  style: apptheme.UserName,
                )),
          ),
          ...screens.entries.map((screen) {
            return ListTile(
              leading: screen.value['icon'],
              title: Text(screen.key),
              onTap: (){
                Navigator.pushNamed(context, screen.value['routename']);
              },
            );
          })
        ],
      ),
    );
  }
}