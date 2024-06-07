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

  const Restaurant({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.tags,
    this.categories,
    this.products,
    this.openingHours,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        description,
        tags,
        categories,
        products,
        openingHours,
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
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      openingHours: openingHours ?? this.openingHours,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id ?? '',
      'name': name ?? '',
      'imageUrl': imageUrl ?? '',
      'description': description ?? '',
      'tags': tags ?? [],
      'categories':
          categories?.map((category) => category.toDocument()).toList() ?? [],
      'products':
          products?.map((product) => product.toDocument()).toList() ?? [],
      'openingHours': openingHours
              ?.map((openinghours) => openinghours.toDocument())
              .toList() ??
          [],
    };
  }

  factory Restaurant.fromSnapshot(DocumentSnapshot snap) {
    return Restaurant(
      id: snap.id,
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      description: snap['description'],
      tags: (snap['tags'] as List<dynamic>?)
              ?.map((tag) => tag as String)
              .toList() ??
          [],
      categories: (snap['categories'] as List<dynamic>?)
              ?.map((category) => Category.fromSnapshot(category))
              .toList() ??
          [],
      products: (snap['products'] as List<dynamic>?)
              ?.map((product) => Product.fromSnapshot(product))
              .toList() ??
          [],
      openingHours: (snap['openingHours'] as List<dynamic>?)
              ?.map((openinghours) => OpeningHours.fromSnapshot(openinghours))
              .toList() ??
          [],
    );
  }

  static List<Restaurant> restaurants = [
    Restaurant(
      id: '1',
      name: 'Golden Gate Restaurant',
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1670984940113-f3aa1cd1309a?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      description: "This is a description",
      tags: ['Italian', 'Desserts'],
      categories: Category.categories,
      products: Product.products,
      openingHours: OpeningHours.openingHoursList,
    ),
  ];
}
