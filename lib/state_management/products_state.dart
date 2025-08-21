part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}


final class ProductsLoading extends ProductsState {}
final class ProductsDone extends ProductsState {
 final ProductsModel productsModel;
  ProductsDone (this.productsModel);

}
final class ProductsError extends ProductsState {

  final String errorMessage;
  ProductsError(this.errorMessage);
}
