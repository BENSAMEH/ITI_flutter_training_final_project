import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui_firebase_auth/state_management/categories_products_cubit.dart';
import '../Components/product_item_widget.dart';
import 'package:login_ui_firebase_auth/Models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;

  const CategoryProductsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CategoriesProductsCubit()..getCategoriyProducts(categoryName),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryName[0].toUpperCase() + categoryName.substring(1),
                style: GoogleFonts.rubik(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Container(color: const Color(0xffff8383), width: 80, height: 4),
              const SizedBox(height: 20),

              Expanded(
                child: BlocBuilder<CategoriesProductsCubit, CategoriesProductsState>(
                  builder: (context, state) {
                    if (state is CategoriesProductsLoading) {
                      return const Center(child: CircularProgressIndicator(color: Color(0xffff8383),));
                    } else if (state is CategoriesProductsError) {
                      return Center(child: Text(state.errorMessage));
                    } else if (state is CategoriesProductsDone) {
                      ProductsModel products = state.productsModel;

                      return GridView.builder(
                        itemCount: products.products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          return ProductItemWidget(product: products.products[index]);
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
