part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}


class AddProduct extends ProductEvent {
  
  final Product product;

  const AddProduct({required this.product});

  @override
  List<Object> get props => [product];
}


// Used to show all the products when the app starts 
class LoadProducts extends ProductEvent{

  final List<Product> products;

  LoadProducts({this.products = const <Product> []});

  @override
  List<Object> get props => [products];
}

// Used to update the products and filter it based on category
class UpdateProducts extends ProductEvent{

  final Category category;

  UpdateProducts({required this.category});

  @override
  List<Object> get props => [category];
}

// To reshuffle/reorder the products shown same as in category 
class SortProducts extends ProductEvent{
  final int oldIndex;
  final int newIndex;

  SortProducts({required this.oldIndex, required this.newIndex});

   @override
  List<Object> get props => [oldIndex,newIndex];
}

