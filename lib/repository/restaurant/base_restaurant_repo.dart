import 'package:eatsy_food_delivery_app_backend/models/opening_hours.dart';
import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:eatsy_food_delivery_app_backend/models/restaurant_model.dart';

abstract class BaseRestaurantRepository {

// To Add a new Restaurant
  Future<void> addRestaurant(Restaurant restaurant);

// To edit restaurant settings
  Future<void> editRestaurantSettings(Restaurant restaurant);

// To edit Opening Hours
  Future<void> editRestaurantOpeningHours(List<OpeningHours> openinghours);

// To edit products 
  Future<void> editProducts(List<Product> products);

// To fetch restaurant data
  Stream<Restaurant> getRestaurant();
}