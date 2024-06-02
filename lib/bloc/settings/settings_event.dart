part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

// To add a new restaurant and change the state 
class LoadSettings extends SettingsEvent{
  final Restaurant restaurant;

  LoadSettings(this.restaurant);

  @override
  List<Object> get props => [restaurant];
}

// To Update the details of the restaurant
class UpdateSettings extends SettingsEvent{

  final Restaurant restaurant;

  UpdateSettings(this.restaurant); 

  @override
  List<Object> get props => [restaurant];
}

// To change the opening hours of the restaurant
class UpdateOpeningHours extends SettingsEvent{
  final OpeningHours openinghours;

  UpdateOpeningHours(this.openinghours);

  @override
  List<Object> get props => [openinghours];
}
