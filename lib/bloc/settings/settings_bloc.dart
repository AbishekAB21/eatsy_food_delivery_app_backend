import 'package:bloc/bloc.dart';
import 'package:eatsy_food_delivery_app_backend/models/opening_hours.dart';
import 'package:eatsy_food_delivery_app_backend/models/restaurant_model.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsLoading()) {
    on<LoadSettings>(_onLoadSettings);
    on<UpdateSettings>(_onUpdateSettings);
    on<UpdateOpeningHours>(_onUpdateOpeningHours);
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
  ) {}

  void _onUpdateOpeningHours(
    UpdateOpeningHours event,
    Emitter<SettingsState> emit,
    // An Emitter is a class which is capable of emitting new states
  ) {}
}
