part of 'categories_products_cubit.dart';

@immutable
sealed class CategoriesProductsState {}

final class CategoriesProductsLoading extends CategoriesProductsState {}

final class CategoriesProductsDone extends CategoriesProductsState {
  final ProductsModel productsModel;

  CategoriesProductsDone({required this.productsModel});
}

final class CategoriesProductsError extends CategoriesProductsState {
  final String errorMessage;

  CategoriesProductsError({required this.errorMessage});
}
