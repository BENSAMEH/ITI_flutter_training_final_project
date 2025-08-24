import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadTitle extends StatelessWidget {
  String title;
   double lineWidth;
   HeadTitle({super.key,required this.title,required this.lineWidth});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.rubik(
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            color: const Color(0xffff8383),
            width: lineWidth,
            height: 4,
          ),
        ],
      ),
    );
  }
}
