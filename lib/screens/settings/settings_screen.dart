import 'package:eatsy_food_delivery_app_backend/bloc/settings/settings_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/config/responsive.dart';
import 'package:eatsy_food_delivery_app_backend/utils/apptheme.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_app_bar.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_drawer.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_layout.dart';
import 'package:eatsy_food_delivery_app_backend/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.primaryColor,
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: CustomLayout(
        title: "Settings",
        widgets: [
          _buildImage(),
          Responsive.isDesktop(context) || Responsive.isWideDesktop(context)
              ? IntrinsicHeight(
                  /*
            IntrinsicHeight makes sure that
            both the widgets are of the same height
            */
                  child: Row(
                    children: [
                      Expanded(child: _buildBasicInformation()),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _buildRestaurantDescription()),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBasicInformation(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildRestaurantDescription(),
                  ],
                ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text("Opening Hours", style: apptheme.healdline4,),
          )
        ],
      ),
    );
  }

  Container _buildBasicInformation() {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: apptheme.secondaryColor,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: apptheme.primaryColor2,
              ),
            );
          }
          if (state is SettingsLoaded) {
            return Column(
              children: [
                Text(
                  "Basic Information",
                  style: apptheme.healdline4,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: "Name",
                  hasTitle: true,
                  initialValue: (state.restaurant.name != null)
                      ? state.restaurant.name!
                      : '',
                  maxlines: 1,
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                        UpdateSettings(state.restaurant.copyWith(name: value)));
                  },
                ),
                CustomTextFormField(
                  title: "Image",
                  hasTitle: true,
                  initialValue: (state.restaurant.imageUrl != null)
                      ? state.restaurant.imageUrl!
                      : '',
                  maxlines: 1,
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(UpdateSettings(
                        state.restaurant.copyWith(imageUrl: value)));
                  },
                ),
                CustomTextFormField(
                  title: "Tags",
                  hasTitle: true,
                  initialValue: (state.restaurant.tags != null)
                      ? state.restaurant.tags!.join(',')
                      : '',
                  maxlines: 1,
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(UpdateSettings(
                        state.restaurant.copyWith(tags: value.split(','))));
                  },
                ),
              ],
            );
          } else {
            return Text("Something went wrong");
          }
        },
      ),
    );
  }

  BlocBuilder<SettingsBloc, SettingsState> _buildImage() {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const SizedBox();
        }
        if (state is SettingsLoaded) {
          return (state.restaurant.imageUrl != null)
              ? Container(
                  height: 200,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(state.restaurant.imageUrl!),
                          fit: BoxFit.cover)),
                )
              : SizedBox();
        } else {
          return Text("Something went wrong");
        }
      },
    );
  }

  Container _buildRestaurantDescription() {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: apptheme.secondaryColor,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: apptheme.primaryColor2,
              ),
            );
          }
          if (state is SettingsLoaded) {
            return Column(
              children: [
                Text(
                  "Restaurant Description",
                  style: apptheme.healdline4,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: "Descrpition",
                  hasTitle: false,
                  initialValue: (state.restaurant.description != null)
                      ? state.restaurant.description!
                      : '',
                  maxlines: 5,
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(UpdateSettings(
                        state.restaurant.copyWith(description: value)));
                  },
                ),
              ],
            );
          } else {
            return Text("Something went wrong");
          }
        },
      ),
    );
  }
}
