import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DevInfo extends StatelessWidget {
  const DevInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahmed Sameh ",
                  style: GoogleFonts.rubik(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Container(color: const Color(0xffff8383), width: 80, height: 4),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "- Flutter Developer",
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Container(color: const Color(0xffff8383), width: 80, height: 4),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "- 20 Years Old",
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Container(color: const Color(0xffff8383), width: 80, height: 4),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "- Faculty of computer science",
                  style: GoogleFonts.rubik(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Container(color: const Color(0xffff8383), width: 80, height: 4),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "- Software Engineering",
                  style: GoogleFonts.rubik(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Container(color: const Color(0xffff8383), width: 80, height: 4),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "- GPA 3.0",
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Container(color: const Color(0xffff8383), width: 50, height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
