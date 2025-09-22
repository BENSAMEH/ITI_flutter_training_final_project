import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui_firebase_auth/Components/bottom_navigation_bar.dart';
import 'package:login_ui_firebase_auth/Components/custom_drawer.dart';
import 'package:login_ui_firebase_auth/Screens/cart_screen.dart';
import 'package:login_ui_firebase_auth/Screens/categories_screen.dart';
import 'package:login_ui_firebase_auth/Screens/home_screen.dart';
import 'package:login_ui_firebase_auth/Screens/welcome_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ?userEmail;
  String ?userName;
  int currentIndex = 1;
  List screens = [CartScreen(), HomeScreen(), CategoriesScreen()];
  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      final data = doc.data();
      if (data != null) {print("Firestore data: ${doc.data()}");
        setState(() {
          userName = data['name'] ?? 'No Name';
          userEmail = data['email'] ?? currentUser.email ?? 'No Email';
        });
        print("user name: $userName, user email: $userEmail");
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          (route) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(userEmail: userEmail??"", userName: userName??"",signOut: signOut,),

      body: screens[currentIndex],
      bottomNavigationBar:CustomBottomNavBar(currentIndex: currentIndex, onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },),
    );
  }
}
