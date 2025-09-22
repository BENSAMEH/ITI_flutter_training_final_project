import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui_firebase_auth/Components/cart_product_card.dart';
import 'package:login_ui_firebase_auth/state_management/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart 🛒",
          style: GoogleFonts.rubik(fontWeight: FontWeight.w600,color:Theme.of(context).appBarTheme.foregroundColor),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
       
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.cartList.isEmpty) {
            return const Center(
              child: Text(
                "Your cart is empty 🛒",
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            // حساب السعر الكلي
            double totalPrice = state.cartList.fold(
              0,
                  (sum, product) => sum + (product.price*product.quantity),
            );

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.cartList.length,
                    itemBuilder: (context, index) {
                      final product = state.cartList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: ProductCartCard(product: product),
                      );
                    },
                  ),
                ),


                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),Spacer(flex:1,),
                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),Spacer(flex: 5,),
                     GestureDetector(onTap: () {
                       context.read<CartCubit>().clearCart();
                     },
                       child: Container(height: 30,width: 140,decoration: BoxDecoration(color: Theme.of(context).primaryColor),

                          child: Center(child: Text("Clear Cart",style: GoogleFonts.rubik(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),)),
                        ),
                     )

                    ],
                  ),
                ),SizedBox(height: 20,)
              ],
            );
          }
        },
      ),
    );
  }
}
