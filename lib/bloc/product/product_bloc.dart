import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eatsy_food_delivery_app_backend/bloc/category/category_bloc.dart';
import 'package:eatsy_food_delivery_app_backend/models/category_model.dart';
import 'package:eatsy_food_delivery_app_backend/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final CategoryBloc _categoryBloc;
  StreamSubscription? _categorySubscription;
  ProductBloc({required CategoryBloc categoryBloc})
      : _categoryBloc = categoryBloc,
/* 
The above code makes it possible for us to keep in 
track of all the state changes and to know if or whern 
a category has been selected.
*/
        super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<UpdateProducts>(_onUpdateProducts);
    on<SortProducts>(_onSortProducts);

/* 
Here with the help of stream we will listen to the state changes.
depending on the fulfilment of the conditional statements, we will 
call UpdateProducts and pass the selectedCategory so that the products 
can be sorted as per that category.
*/
_categorySubscription = _categoryBloc.stream.listen((state) {
  if(state is CategoryLoaded && state.selectedCategory != null){
    UpdateProducts(category: state.selectedCategory!);
  }
});
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    await Future.delayed(Duration(seconds: 1));
    emit(ProductLoaded(products: event.products));
  }

  void _onUpdateProducts(
      UpdateProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    await Future.delayed(Duration(seconds: 1));

    List<Product> filterProducts = Product.products
        .where((product) => product.category == event.category.name)
        .toList();

/* 
After filtering we can pass the list into the ProductLoaded state as 
the new list of products to be displayed.
*/
    emit(ProductLoaded(products: filterProducts));
  }

  void _onSortProducts(SortProducts event, Emitter<ProductState> emit) {}
}
