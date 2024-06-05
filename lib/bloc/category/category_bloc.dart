import 'package:bloc/bloc.dart';
import 'package:eatsy_food_delivery_app_backend/models/category_model.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<Sortcategory>(_onSortCategories);
    on<SelectCategory>(_onSelectCategory);
  }

  void _onLoadCategories(
      LoadCategories event, Emitter<CategoryState> emit) async {
    await Future.delayed(Duration(seconds: 1));
    emit(CategoryLoaded(categories: event.categories));
  }

  void _onSortCategories(
      Sortcategory event, Emitter<CategoryState> emit) async {
    final state = this.state as CategoryLoaded;
    emit(CategoryLoading());
    await Future.delayed(Duration(seconds: 1));

    int newIndex =
        (event.newIndex > event.oldIndex) ? event.newIndex - 1 : event.newIndex;

    try {
      Category selectedCategory = state.categories[event.oldIndex];

/* 

Here we take a selected category and remove it from the list and 
insert it back into the list but into a new position/index thus shuffling 
the list

*/
      List<Category> sortCategories = List.from(state.categories)
        ..remove(selectedCategory)
        ..insert(newIndex, selectedCategory);

      // emits new Category Loaded with updated/shuffled categories
      emit(CategoryLoaded(categories: sortCategories));
    } catch (_) {}
  }

  void _onSelectCategory(SelectCategory event, Emitter<CategoryState> emit) {}
}
