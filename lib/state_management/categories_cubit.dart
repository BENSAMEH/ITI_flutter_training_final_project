import 'package:bloc/bloc.dart';
import 'package:login_ui_firebase_auth/Api/api_provider.dart';
import 'package:login_ui_firebase_auth/Models/category_model.dart';
import 'package:login_ui_firebase_auth/Models/product_model.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesLoading());

  getCategories() async {
    try {
      late List<CategoryModel> categoryModel;
      categoryModel = await ApiProvider().fetchCategories();
      emit(CategoriesDone(categoryModel: categoryModel));
    } catch (e) {
      emit(CategoriesError(errorMessage: e.toString()));
    }
  }
}
