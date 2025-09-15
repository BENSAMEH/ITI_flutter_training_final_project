import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {

  CartCubit() : super(CartInitial(cartList: []));

  addProduct(Product product){
    final updatedList = List<Product>.from(state.cartList)..add(product);
    emit(CartUpdate(cartList: updatedList));
  }
  removeProduct(Product product) {
    final updatedList = List<Product>.from(state.cartList)..remove(product);
    emit(CartUpdate(cartList: updatedList));
  }
  clearCart(){
    emit(CartUpdate(cartList: []));
  }
}
