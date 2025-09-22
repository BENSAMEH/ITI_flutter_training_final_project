import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui_firebase_auth/Screens/cart_screen.dart';

import '../Models/product_model.dart';

import '../state_management/cart_cubit.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          widget.product.category,
          style: GoogleFonts.rubik(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
        ),

        centerTitle: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon:  Icon(Icons.arrow_back, color: Theme.of(context).appBarTheme.foregroundColor),
        ),
        actions: [
          SizedBox(width: 15),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned(
                    right: 70,
                    bottom: -10,
                    child: Opacity(
                      opacity: .5,
                      child: Image.network(
                        widget.product.thumbnail,
                        width: 200,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 80,
                    bottom: -20,
                    child: Image.network(widget.product.thumbnail, width: 200),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            widget.product.title,
            style: GoogleFonts.rubik(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              widget.product.description,
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Price: ", style: GoogleFonts.rubik(fontSize: 24)),
              Text(
                "${widget.product.price} \$",
                style: GoogleFonts.rubik(
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 280),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                context.read<CartCubit>().addProduct(widget.product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.product.title} added to cart"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text(
                    "Add To Cart",
                    style: GoogleFonts.rubik(color: Theme.of(context).appBarTheme.backgroundColor, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
