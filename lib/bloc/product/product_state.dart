part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

final class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {

  final List<Product> products;

  ProductLoaded({this.products = const <Product>[]});

   @override
  List<Object> get props => [products];
}
