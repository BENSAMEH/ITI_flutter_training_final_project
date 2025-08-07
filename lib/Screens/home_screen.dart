import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui_firebase_auth/Api/api_provider.dart';
import 'package:login_ui_firebase_auth/Models/product_model.dart';
import 'package:login_ui_firebase_auth/Screens/about_app_screen.dart';
import 'package:login_ui_firebase_auth/Screens/details_screen.dart';
import 'package:login_ui_firebase_auth/Screens/dev_info.dart';
import '../Components/product_item_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<ProductsModel> productsModel = ApiProvider().getAllProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DevInfo()),
            );
          },
          icon: Icon(Icons.person_pin),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutAppScreen()),
              );
            },
            icon: Icon(Icons.question_mark),
          ),
          SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Products",
                    style: GoogleFonts.rubik(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    color: const Color(0xffff8383),
                    width: 80,
                    height: 4,
                  ),
                ],
              ),
            ),

            Expanded(
              child: FutureBuilder<ProductsModel>(
                future: productsModel,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData ||
                      snapshot.data!.products.isEmpty) {
                    return const Center(child: Text("No products found"));
                  }

                  final products = snapshot.data!.products;

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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
