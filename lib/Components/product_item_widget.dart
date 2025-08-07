import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui_firebase_auth/Screens/details_screen.dart';

import '../Models/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;

  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(product: product),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // لون الظل
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30),
                Stack(
                  children: [
                    Positioned(
                      bottom: 4,
                      left: 6,
                      child: Opacity(
                        opacity: .2,
                        child: Image.network(
                          product.thumbnail,
                          height: 120,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: .95,
                      child: Image.network(product.thumbnail, height: 120),
                    ),
                  ],
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      product.title,
                      style: GoogleFonts.rubik(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '\$${product.price}',
                  style: GoogleFonts.rubik(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
