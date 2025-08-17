import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_ui_firebase_auth/Screens/categories_screen.dart';
import 'package:login_ui_firebase_auth/Screens/home_screen.dart';
import 'package:login_ui_firebase_auth/Screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;
  List screens = [ProfileScreen(), HomeScreen(), CategoriesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedLabelStyle: GoogleFonts.rubik(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        iconSize: 35,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade700,
        unselectedLabelStyle: GoogleFonts.rubik(fontWeight: FontWeight.w500),
        currentIndex: currentIndex,
        backgroundColor: Color(0xFFFF8383),
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
        ],
      ),
    );
  }
}
