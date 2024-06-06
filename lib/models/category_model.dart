import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int index;

  Category(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.index});

  Category copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    int? index,
  }) {
    return Category(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        index: index ?? this.index);
  }


/* 
With this toDocument method we can save convert the model into a map and save
it to the firebase databsase
*/
  Map<String, dynamic> toDocument(){

    return {
      'id' : id,
      'name' : name,
      'decription' : description,
      'imageUrl' : imageUrl,
      'index' : index
    };
  }

  factory Category.fromSnapshot(Map<String, dynamic> snap) {
    return Category(
        id: snap['id'].toString(),
        name: snap['name'],
        description: snap['description'],
        imageUrl: snap['imageUrl'],
        index: snap['index']);
  }

  @override
  List<Object?> get props => [id, name, description, imageUrl, index];

  static List<Category> categories = [
    Category(
        id: "1",
        name: "Salads",
        description: "A Healthy Salad",
        imageUrl: "assets/salad.png",
        index: 0),
    Category(
        id: "2",
        name: "Desserts",
        description: "A tasty dessert",
        imageUrl: "assets/icecream.png",
        index: 1),
    Category(
        id: "3",
        name: "Drinks",
        description: "A Refreshing Drink",
        imageUrl: "assets/juice.png",
        index: 2),
    Category(
        id: "4",
        name: "Pizza",
        description: "Veg and Non-veg Pizzas",
        imageUrl: "assets/pizza2.png",
        index: 3),
    Category(
        id: "5",
        name: "Burger",
        description: "Veg and Non-veg Burgers",
        imageUrl: "assets/burger2.png",
        index: 4),
  ];
}
