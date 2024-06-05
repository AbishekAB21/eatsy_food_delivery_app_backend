part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

// To load Categories on the screen while the app starts
class LoadCategories extends CategoryEvent {
  final List<Category> categories;

  LoadCategories({this.categories = const <Category>[]});

  @override
  List<Object?> get props => [categories];
}

// triggered when the user clicks on a category
class SelectCategory extends CategoryEvent {
  final Category? category;

  SelectCategory(this.category);

  @override
  List<Object?> get props => [category];
}

// Used to re-shuffle the category list
class Sortcategory extends CategoryEvent {
  final int oldIndex;
  final int newIndex;

  Sortcategory({required this.oldIndex, required this.newIndex});

  @override
  List<Object?> get props => [oldIndex, newIndex];
}
