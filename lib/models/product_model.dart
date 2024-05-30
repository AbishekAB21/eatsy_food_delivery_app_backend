import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  final int index;

  Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.index});

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
    int? index,
  }) {
    return Product(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        price: price ?? this.price,
        index: index ?? this.index);
  }

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
      id: snap['id'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      index: snap['index'],
    );
  }

  @override
  List<Object?> get props =>
      [id, name, category, description, imageUrl, price, index];

  static List<Product> products = [
    Product(
      id: '1',
      name: 'Margherita',
      category: 'Pizza',
      description: 'Tomatoes, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 120,
      index: 0,
    ),
    Product(
      id: '2',
      name: 'Chicken Supreme',
      category: 'Pizza',
      description: 'Chicken, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 320,
      index: 1,
    ),
    Product(
      id: '3',
      name: 'Paneer Delight',
      category: 'Pizza',
      description: 'Tomatoes, Paneer and Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 180,
      index: 2,
    ),
    Product(
      id: '4',
      name: 'Pepperoni',
      category: 'Pizza',
      description: 'Pepperonni, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 310,
      index: 3,
    ),
    Product(
      id: '5',
      name: 'Chicago Pizza',
      category: 'Pizza',
      description: 'Cheese, Meat and Veggies',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 310,
      index: 4,
    ),
    Product(
      id: '6',
      name: 'Cheese Pizza',
      category: 'Pizza',
      description: 'Pepperonni, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 140,
      index: 5,
    ),
    Product(
      id: '7',
      name: 'Jalapeno Pizza',
      category: 'Pizza',
      description: 'Jalapenos, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 210,
      index: 6,
    ),
    Product(
      id: '8',
      name: 'Veg Pizza',
      category: 'Pizza',
      description: 'Capsicum, Onions and Mozzerella Cheese',
      imageUrl:
          "https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=2736&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 110,
      index: 7,
    ),
  ];
}
