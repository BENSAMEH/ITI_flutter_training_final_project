import 'package:bloc/bloc.dart';
import 'package:login_ui_firebase_auth/Api/api_provider.dart';
import 'package:login_ui_firebase_auth/Models/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  late ProductsModel productsModel;
  ProductsCubit() : super(ProductsLoading());

getProducts()async{

 try {
   emit(ProductsLoading());
   productsModel=await ApiProvider().getAllProducts();
   emit(ProductsDone(productsModel));

 }catch(e){
   emit(ProductsError(e.toString()));
 }
}
}

