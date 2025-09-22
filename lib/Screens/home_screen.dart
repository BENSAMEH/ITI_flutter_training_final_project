import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';



import 'package:login_ui_firebase_auth/Components/head_title.dart';

import 'package:login_ui_firebase_auth/Components/spin_kit.dart';
import '../Components/product_item_widget.dart';
import 'package:login_ui_firebase_auth/state_management/products_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(elevation: 0,scrolledUnderElevation: 0,
        backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(onPressed: () {
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu)),

      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadTitle(title: "Products", lineWidth: 60),

            Expanded(
              child: BlocConsumer<ProductsCubit, ProductsState>(
                listener: (context, state) {
                  if (state is ProductsError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return  Center(
                      child: SpinKitItem()
                    );
                  } else if (state is ProductsError) {
                    return Center(child: Text("Error: ${state.errorMessage}"));
                  } else if (state is ProductsDone) {
                    final products = state.productsModel.products;
                    return GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: .75,
                          ),
                      itemBuilder: (context, index) {
                        return ProductItemWidget(product: products[index]);
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
    );
  }
}
