import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui_firebase_auth/Components/head_title.dart';

import '../Components/about_screen_bullet.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only( bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 HeadTitle(title: "Description !", lineWidth: 60)
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "- Flutter E-Commerce UI + Firebase Auth",
              style: GoogleFonts.rubik(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1e1e1e),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "-" "This is a simple e-commerce Flutter app integrated with Firebase Authentication and Firestore, using real product data from dummyjson.com. The app also implements state management (Bloc/Cubit) to efficiently handle categories, products, and UI states. ",
              style: GoogleFonts.rubik(
                fontSize: 16,fontWeight: FontWeight.w500,
                color: const Color(0xff4b4b4b),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "- Features",
              style: GoogleFonts.rubik(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1e1e1e),
              ),
            ),
            bullet("User Sign In & Sign Up with Firebase Auth"),
            bullet("User data saved to Firestore"),
            bullet("Profile screen with editable fields"),
            bullet("Logout to welcome screen"),
            bullet("Fetch categories from dummyjson.com"),
            bullet("Display products in GridView per category"),
            bullet("Responsive UI with Google Fonts"),
            const SizedBox(height: 16),
            Text(
              "- Tech Stack",
              style: GoogleFonts.rubik(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1e1e1e),
              ),
            ),
            bullet("Flutter (Frontend)"),
            bullet("Firebase Auth & Firestore"),
            bullet("Cubit State Management"),
            bullet("Dio for HTTP requests"),
            bullet("REST API from dummyjson.com"),
            bullet("Google Fonts"),
            const SizedBox(height: 16),
            Text(
              "- Implemented Screens",
              style: GoogleFonts.rubik(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1e1e1e),
              ),
            ),
            bullet("Welcome Screen"),
            bullet("Sign In / Sign Up"),
            bullet("Profile Screen"),
            bullet("Categories List"),
            bullet("Products Grid View"),
            bullet("Product Details Screen"),
            bullet("Developer information Screen"),
            bullet("App Description Screen"),
            const SizedBox(height: 16),
            Text(
              "- Future Ideas",
              style: GoogleFonts.rubik(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1e1e1e),
              ),
            ),
            bullet("Cart Screen"),
            bullet("Favorites"),
            bullet("Product Search"),
            bullet("Product Filtering"),
          ],
        ),
      ),
    );
  }
}

