import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {

  CartCubit() : super(CartInitial(cartList: []));

  addProduct(Product product){
    final updatedList = List<Product>.from(state.cartList);
    final index = updatedList.indexWhere((p) => p.id == product.id);

    if (index != -1) {
      // لو المنتج موجود نزود الكمية
      final existingProduct = updatedList[index];
      updatedList[index] = existingProduct.copyWith(
        quantity: existingProduct.quantity + 1,
      );
    } else {
      // لو مش موجود ضيفه بـ quantity = 1
      updatedList.add(product.copyWith(quantity: 1));
    }

    emit(CartUpdate(cartList: updatedList));
  }void decreaseQuantity(Product product) {
    final updatedList = List<Product>.from(state.cartList);
    final index = updatedList.indexWhere((p) => p.id == product.id);

    if (index != -1) {
      final existingProduct = updatedList[index];
      if (existingProduct.quantity > 1) {
        updatedList[index] = existingProduct.copyWith(
          quantity: existingProduct.quantity - 1,
        );
      } else {
        updatedList.removeAt(index); // لو وصل 0 نشيله
      }
      emit(CartUpdate(cartList: updatedList));
    }
  }
  removeProduct(Product product) {
    final updatedList = List<Product>.from(state.cartList)
      ..removeWhere((p) => p.id == product.id);
    emit(CartUpdate(cartList: updatedList));
  }
  clearCart(){
    emit(CartUpdate(cartList: []));
  }
}
