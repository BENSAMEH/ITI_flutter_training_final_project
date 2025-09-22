
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/about_app_screen.dart';
import '../Screens/contact_screen.dart';
import '../Screens/dev_info.dart';
import '../Screens/profile_screen.dart';

import '../state_management/theme_cubit.dart';

class CustomDrawer extends StatelessWidget {
  String userName;
  String userEmail;
  final VoidCallback signOut;

   CustomDrawer({super.key,required this.userEmail,required this.userName,required this.signOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 🔹 Profile Section
          GestureDetector(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
          },
            child: UserAccountsDrawerHeader(
              accountName: Text(userName.isNotEmpty == true ? userName : "Loading...",style: GoogleFonts.rubik(fontSize: 20,fontWeight: FontWeight.bold),),
              accountEmail: Text(userEmail.isNotEmpty == true ? userEmail : "Loading...",style: GoogleFonts.rubik(fontSize: 15,fontWeight: FontWeight.w600),),
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
            title: Text("Developer Info",style: GoogleFonts.rubik(fontWeight: FontWeight.bold),),
            subtitle: Text("Flutter Developer",style: GoogleFonts.rubik(fontWeight: FontWeight.w500),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DevInfo(),));
            },
          ),

          // 🔹 Contacts
          ListTile(
            leading: Icon(Icons.contacts, color: Colors.green),
            title: Text("Contacts",style: GoogleFonts.rubik(fontWeight: FontWeight.bold),),
            subtitle: Text("Phone, Email, LinkedIn",style: GoogleFonts.rubik(fontWeight: FontWeight.w500),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactScreen(),));
            },
          ),

          // 🔹 About App
          ListTile(
            leading: Icon(Icons.info, color: Colors.orange),
            title: Text("About App",style: GoogleFonts.rubik(fontWeight: FontWeight.bold),),
            subtitle: Text("More about this application",style: GoogleFonts.rubik(fontWeight: FontWeight.w500),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppScreen(),));
            },
          ),

          Divider(),

          // 🔹 Logout
          ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout",style: GoogleFonts.rubik(fontWeight: FontWeight.bold),),
              onTap:signOut
          ),SwitchListTile(
            title:  Text("Dark Mode",style:GoogleFonts.rubik(fontWeight: FontWeight.bold)),
            value: context.read<ThemeCubit>().state == ThemeMode.dark,
            onChanged: (val) {
              context.read<ThemeCubit>().toggleTheme(val);
            },
          ),
        ],
      ),
    );
  }
}
