
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatsy_food_delivery_app_backend/models/category_model.dart';
import 'package:eatsy_food_delivery_app_backend/models/opening_hours.dart';
import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? description;
  final List<String>? tags;
  final List<Category>? categories;
  final List<Product>? products;
  final List<OpeningHours>? openingHours;

  const Restaurant(this.id, this.name, this.imageUrl, this.description, this.tags,
      this.categories, this.products, this.openingHours);

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        description,
        tags,
        categories,
        products,
        openingHours
      ];

  Restaurant copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? description,
    List<String>? tags,
    List<Category>? categories,
    List<Product>? products,
    List<OpeningHours>? openingHours,
  }) {
    return Restaurant(
        id ?? this.id,
        name ?? this.name,
        imageUrl ?? this.imageUrl,
        description ?? this.description,
        tags ?? this.tags,
        categories ?? this.categories,
        products ?? this.products,
        openingHours ?? this.openingHours);
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id ?? '',
      'name': name ?? '',
      'description': description ?? '',
      'tags': tags ?? [],
// We are mapping it and returning them as a list of document
      'categories': categories!.map((category) {
        return category.toDocument();
      }).toList(),
      'products': products!.map((product) {
        return product.toDocument();
      }).toList(),
      'openingHours': openingHours!.map((openinghours) {
        return openinghours.toDocument();
      }).toList(),
    };
  }

  factory Restaurant.fromSnapshot(DocumentSnapshot snap) {
    return Restaurant(
      snap.id,
      snap['name'],
      snap['imageUrl'],
      snap['description'],
      (snap['tags'] as List).map((tag) {
        return tag as String;
      }).toList(),
      (snap['categories'] as List).map((category) {
        return Category.fromSnapshot(category);
      }).toList(),
      (snap['products'] as List).map((product) {
        return Product.fromSnapshot(product);
      }).toList(),
      (snap['openingHours'] as List).map((openinghours) {
        return OpeningHours.fromSnapshot(openinghours);
      }).toList(),
    );
  }

  static List<Restaurant> restaurants = [
    Restaurant(
        '1',
        'Golden Gate Restaurant',
        "https://plus.unsplash.com/premium_photo-1670984940113-f3aa1cd1309a?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "This is a description",
        ['Italian', 'Desserts'],
        Category.categories,
        Product.products,
        OpeningHours.openingHoursList)
  ];
}
