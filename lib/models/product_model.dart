import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;

  Product({
     this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
    );
  }

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
      id: snap['id'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        description,
        imageUrl,
        price,
      ];

  static List<Product> products = [
    Product(
      id: '1',
      name: 'Margherita',
      category: 'Pizza',
      description: 'Tomatoes, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 120,
    ),
    Product(
      id: '2',
      name: 'Cocoa-Cola',
      category: 'Drinks',
      description: 'Chicken, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 320,
    ),
    Product(
      id: '3',
      name: 'Spanish Delight',
      category: 'Desserts',
      description: 'Tomatoes, Paneer and Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 180,
    ),
    Product(
      id: '4',
      name: 'Pepperoni',
      category: 'Pizza',
      description: 'Pepperonni, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 310,
    ),
    Product(
      id: '5',
      name: 'Chicago Pizza',
      category: 'Pizza',
      description: 'Cheese, Meat and Veggies',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 310,
    ),
    Product(
      id: '6',
      name: 'Cheese Pizza',
      category: 'Pizza',
      description: 'Pepperonni, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 140,
    ),
    Product(
      id: '7',
      name: 'Greek Salad',
      category: 'Salads',
      description: 'Jalapenos, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 210,
    ),
    Product(
      id: '8',
      name: 'CheeseBurger',
      category: 'Burger',
      description: 'Capsicum, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 110,
    ),
  ];
}
