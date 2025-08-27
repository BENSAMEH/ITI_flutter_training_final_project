import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';



import 'package:login_ui_firebase_auth/Components/head_title.dart';
import 'package:login_ui_firebase_auth/Screens/about_app_screen.dart';
import 'package:login_ui_firebase_auth/Screens/dev_info.dart';
import '../Components/product_item_widget.dart';
import 'package:login_ui_firebase_auth/state_management/products_cubit.dart';

import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(elevation: 0,scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DevInfo()),
            );
          },
          icon: const Icon(Icons.person_pin,color: Colors.black,),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: Icon(Icons.shopping_cart,color: Colors.black,),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutAppScreen()),
              );
            },
            icon: const Icon(Icons.question_mark_outlined,color: Colors.black,),
          ),
          const SizedBox(width: 20),
        ],
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
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
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
