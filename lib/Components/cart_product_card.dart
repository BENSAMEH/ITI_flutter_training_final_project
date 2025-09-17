import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui_firebase_auth/Models/product_model.dart';
import 'package:login_ui_firebase_auth/Screens/details_screen.dart';

import '../state_management/cart_cubit.dart';

class ProductCartCard extends StatefulWidget {
  Product product;


  ProductCartCard({super.key, required this.product});

  @override
  State<ProductCartCard> createState() => _ProductCartCardState();
}

class _ProductCartCardState extends State<ProductCartCard> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(product: widget.product),));
    },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                widget.product.thumbnail,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),

            // تفاصيل المنتج
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:  GoogleFonts.rubik(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                     SizedBox(height: 6),
                    Text(
                      "\$${(widget.product.price*widget.product.quantity).toStringAsFixed(2)}",
                      style:  GoogleFonts.rubik(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // التحكم في الكمية
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outlined,color: Colors.black,),
                          onPressed: () {
                            context.read<CartCubit>().decreaseQuantity(widget.product);
                          },
                        ),
                        Text(
                          widget.product.quantity.toString(),
                          style: GoogleFonts.rubik(fontSize: 16),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outlined,color: Colors.black,),
                          onPressed: () {
                            context.read<CartCubit>().addProduct(widget.product);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // زرار الحذف
            IconButton(
              icon:  Icon(Icons.delete, color: Theme.of(context).primaryColor),
              onPressed: () {
                context.read<CartCubit>().removeProduct(widget.product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
