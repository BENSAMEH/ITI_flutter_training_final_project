part of 'cart_cubit.dart';

@immutable
sealed class CartState {  final List<Product> cartList;
  CartState({required this.cartList});
}

final class CartInitial extends CartState {
  CartInitial({required super.cartList});


}
final class CartUpdate extends CartState{
  CartUpdate ({required super.cartList});

}

