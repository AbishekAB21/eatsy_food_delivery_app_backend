import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eatsy_food_delivery_app_backend/models/opening_hours.dart';
import 'package:eatsy_food_delivery_app_backend/models/restaurant_model.dart';
import 'package:eatsy_food_delivery_app_backend/repository/restaurant/restaurant_repo.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final RestaurantRepository _restaurantRepository;
  StreamSubscription? _restaurantSubscription;
  SettingsBloc({required RestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository,
        super(SettingsLoading()) {
    on<LoadSettings>(_onLoadSettings);
    on<UpdateSettings>(_onUpdateSettings);
    on<UpdateOpeningHours>(_onUpdateOpeningHours);

    _restaurantSubscription = _restaurantRepository.getRestaurant().listen(
      (restaurant) {
        try {
          print("I'm here now");
          print(restaurant);
          add(LoadSettings(restaurant: restaurant));
        } catch (e) {
          print("Error in subscription: $e");
        }
      },
      onError: (error) {
        print("Stream error: $error");
      },
    );
  }

  void _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
    // An Emitter is a class which is capable of emitting new states
  ) async {
    await Future<void>.delayed(Duration(seconds: 1));
    emit(SettingsLoaded(event.restaurant));
    /* 
       After waiting for a second, emit a SettingsLoaded state 
       with information about the specific restaurant
    */
  }

  void _onUpdateSettings(
    UpdateSettings event,
    Emitter<SettingsState> emit,
    // An Emitter is a class which is capable of emitting new states
  ) {
    emit(SettingsLoaded(event.restaurant));
  }

  void _onUpdateOpeningHours(
    UpdateOpeningHours event,
    Emitter<SettingsState> emit,
    // An Emitter is a class which is capable of emitting new states
  ) {
    final state = this.state;

    if (state is SettingsLoaded) {
      List<OpeningHours> OpeningHoursList =
          (state.restaurant.openingHours!.map((openinghours) {
        return openinghours.id == event.openinghours.id
            ? event.openinghours
            : openinghours;
      })).toList();

      emit(SettingsLoaded(
          state.restaurant.copyWith(openingHours: OpeningHoursList)));
    }
  }

  @override
  Future<void> close() async {
    _restaurantSubscription?.cancel();
    super.close();
  }
}
