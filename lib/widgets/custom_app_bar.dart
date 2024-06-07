import 'package:eatsy_food_delivery_app_backend/bloc/settings/settings_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if(state is SettingsLoading){
          return AppBar(
          backgroundColor: apptheme.primaryColor2,
          title: Text(
            "Your Restaurant Name",
            style: apptheme.UserName,
          ),
          centerTitle: false,
          iconTheme: IconThemeData(color: apptheme.secondaryColor),
        );
        }
        if(state is SettingsLoaded)
        {return AppBar(
          backgroundColor: apptheme.primaryColor2,
          title: Text(
            (state.restaurant.name == null ? "Set a restaurant name" : state.restaurant.name!),
            style: apptheme.UserName,
          ),
          centerTitle: false,
          iconTheme: IconThemeData(color: apptheme.secondaryColor),
        );}
        else{
          return Text("Something went wrong");
        }
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
