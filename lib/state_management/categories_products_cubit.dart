import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:login_ui_firebase_auth/Api/api_provider.dart';
import 'package:login_ui_firebase_auth/Models/product_model.dart';
import 'package:meta/meta.dart';

part 'categories_products_state.dart';

class CategoriesProductsCubit extends Cubit<CategoriesProductsState> {
  CategoriesProductsCubit() : super(CategoriesProductsLoading());

  getCategoriyProducts(String categoryName) async {
    try {
      ProductsModel productsModel = await ApiProvider().getProductsByCategory(
        categoryName,
      );
      emit(CategoriesProductsDone(productsModel: productsModel));
    } catch (e) {
      emit(CategoriesProductsError(errorMessage: e.toString()));
    }
  }
}
