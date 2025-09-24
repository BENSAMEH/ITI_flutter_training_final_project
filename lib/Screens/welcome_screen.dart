import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_ui_firebase_auth/Screens/signin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 600,
              width: double.infinity,
              child: Image.asset(
                'assets/images/Vector.png',
                fit: BoxFit.cover,
                height: 650,
                width: double.infinity,
              ),
            ),

            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 30,
                    child: AnimatedTextKit(
                      pause: const Duration(milliseconds: 1000),
                      repeatForever: true,
                      animatedTexts: [
                        TyperAnimatedText(
                          "Welcome !",
                          speed: const Duration(milliseconds: 300),
                          textStyle: GoogleFonts.rubik(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 30,
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur. Lorem id sit ",
                        style: GoogleFonts.rubik(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    bottom: 100,
                    child: Row(
                      children: [
                        Text(
                          "Continue",
                          style: GoogleFonts.rubik(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          color: Theme.of(context).primaryColor,
                          height: 3,
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              Icons.arrow_right_alt,
                              size: 40,
                              color: Theme.of(context).appBarTheme.backgroundColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
