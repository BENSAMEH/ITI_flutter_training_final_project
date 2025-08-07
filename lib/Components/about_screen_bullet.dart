import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class bullet extends StatelessWidget {
  String text;
  bullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: GoogleFonts.rubik(fontSize: 16,fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}
