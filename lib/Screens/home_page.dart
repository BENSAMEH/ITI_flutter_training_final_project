import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui_firebase_auth/Screens/about_app_screen.dart';

import 'package:login_ui_firebase_auth/Screens/categories_screen.dart';
import 'package:login_ui_firebase_auth/Screens/contact_screen.dart';
import 'package:login_ui_firebase_auth/Screens/dev_info.dart';
import 'package:login_ui_firebase_auth/Screens/home_screen.dart';
import 'package:login_ui_firebase_auth/Screens/profile_screen.dart';
import 'package:login_ui_firebase_auth/Screens/welcome_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ?userEmail;
  String ?userName;
  int currentIndex = 1;
  List screens = [ProfileScreen(), HomeScreen(), CategoriesScreen()];
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // 🔹 Profile Section
            GestureDetector(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
            },
              child: UserAccountsDrawerHeader(
                accountName: Text(userName?.isNotEmpty == true ? userName! : "Loading...",style: GoogleFonts.rubik(fontSize: 20,fontWeight: FontWeight.bold),),
                accountEmail: Text(userEmail?.isNotEmpty == true ? userEmail! : "Loading...",style: GoogleFonts.rubik(fontSize: 15,fontWeight: FontWeight.w600),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.blue),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),

            // 🔹 Developer Info
            ListTile(
              leading: Icon(Icons.code, color: Colors.deepPurple),
              title: Text("Developer Info",style: GoogleFonts.rubik(),),
              subtitle: Text("Flutter Developer",style: GoogleFonts.rubik(),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DevInfo(),));
              },
            ),

            // 🔹 Contacts
            ListTile(
              leading: Icon(Icons.contacts, color: Colors.green),
              title: Text("Contacts",style: GoogleFonts.rubik(),),
              subtitle: Text("Phone, Email, LinkedIn",style: GoogleFonts.rubik(),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactScreen(),));
              },
            ),

            // 🔹 About App
            ListTile(
              leading: Icon(Icons.info, color: Colors.orange),
              title: Text("About App",style: GoogleFonts.rubik(),),
              subtitle: Text("More about this application",style: GoogleFonts.rubik(),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppScreen(),));
              },
            ),

            Divider(),

            // 🔹 Logout
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout",style: GoogleFonts.rubik(),),
              onTap: signOut
            ),
          ],
        ),
      ),

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
        backgroundColor: Theme.of(context).primaryColor,
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
