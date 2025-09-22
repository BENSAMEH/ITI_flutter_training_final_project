import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      backgroundColor: Theme.of(context).primaryColor,
      onTap: onTap, // 👈 بناخدها من الـHomePage
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
      ],
    );
  }
}
