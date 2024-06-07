import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatsy_food_delivery_app_backend/models/opening_hours.dart';
import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:eatsy_food_delivery_app_backend/models/restaurant_model.dart';
import 'package:eatsy_food_delivery_app_backend/repository/restaurant/base_restaurant_repo.dart';

class RestaurantRepository extends BaseRestaurantRepository {
  final FirebaseFirestore _firebaseFirestore;

  RestaurantRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<void> addRestaurant(Restaurant restaurant) async {
    await _firebaseFirestore
        .collection('restaurants')
        .add(restaurant.toDocument());
  }

  @override
  Future<void> editProducts(List<Product> products) async {
    await _firebaseFirestore
        .collection('restaurants')
        .doc('ANjuVdh2xl8Au6RyHEK5')
        .update({
      'products': products.map((product) {
        return product.toDocument();
      }).toList(),
    });
  }

  @override
  Future<void> editRestaurantOpeningHours(
      List<OpeningHours> openinghours) async {
    await _firebaseFirestore
        .collection('restaurants')
        .doc('ANjuVdh2xl8Au6RyHEK5')
        .update({
      'openingHours': openinghours.map((openinghour) {
        return openinghour.toDocument();
      }).toList(),
    });
  }

  @override
  Future<void> editRestaurantSettings(Restaurant restaurant) async {
    await _firebaseFirestore
        .collection('restaurants')
        .doc('ANjuVdh2xl8Au6RyHEK5')
        .update(restaurant.toDocument());
  }

  @override
  Stream<Restaurant> getRestaurant() {
  // Here we are returning a restaurant object 
  // We used snapshot to keep listening to the change
    return _firebaseFirestore
        .collection('restaurants')
        .doc('ANjuVdh2xl8Au6RyHEK5')
        .snapshots()
        .map((snapshot) {
          if(snapshot.exists){
            print("restaurant found");
            return Restaurant.fromSnapshot(snapshot);
          }else{
           throw Exception ("Restaurant not found in database");
          }
      
    });
  }
}
