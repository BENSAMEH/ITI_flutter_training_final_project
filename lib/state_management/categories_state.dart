part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesLoading extends CategoriesState {}
final class CategoriesDone extends CategoriesState {

 final List<CategoryModel> categoryModel;
  CategoriesDone({required this.categoryModel});
}
final class CategoriesError extends CategoriesState {
  final String errorMessage;
  CategoriesError({required this.errorMessage});
}
