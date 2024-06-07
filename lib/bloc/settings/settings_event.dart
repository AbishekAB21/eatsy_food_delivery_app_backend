part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

// To add a new restaurant and change the state
class LoadSettings extends SettingsEvent {
  final Restaurant restaurant;

  LoadSettings(
      {this.restaurant =
          const Restaurant(null, null, null, null, null, null, null, null)});

  @override
  List<Object> get props => [restaurant];
}

// To Update the details of the restaurant
class UpdateSettings extends SettingsEvent {
  final bool isUpdateComplete;
  final Restaurant restaurant;

  UpdateSettings(Restaurant copyWith,
      {this.isUpdateComplete = false, required this.restaurant});

  @override
  List<Object> get props => [restaurant, isUpdateComplete];
}

// To change the opening hours of the restaurant
class UpdateOpeningHours extends SettingsEvent {
  final OpeningHours openinghours;

  UpdateOpeningHours(this.openinghours);

  @override
  List<Object> get props => [openinghours];
}
