import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // --- Links & Info ---
  final String phone = "01090047338";
  final String email = "ahmedsameh77sa@gmail.com";
  final String github = "https://github.com/BENSAMEH";
  final String linkedin = "https://www.linkedin.com/in/ahmed-sameh-602907296";

  // --- Functions ---
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Could not launch $url";
    }
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(emailUri)) {
      throw "Could not send email";
    }
  }

  Future<void> _launchPhone(String phone) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (!await launchUrl(phoneUri)) {
      throw "Could not call $phone";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Contact Me",
          style: GoogleFonts.rubik(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildContactTile(
              icon: Icons.phone,
              title: "Phone",
              subtitle: phone,
              onTap: () => _launchPhone(phone),
            ),
            _buildContactTile(
              icon: Icons.email_outlined,
              title: "Email",
              subtitle: email,
              onTap: () => _launchEmail(email),
            ),
            _buildContactTile(
              icon: Icons.code,
              title: "GitHub",
              subtitle: "github.com/BENSAMEH",
              onTap: () => _launchURL(github),
            ),
            _buildContactTile(
              icon: Icons.business_center,
              title: "LinkedIn",
              subtitle: "linkedin.com/in/ahmed-sameh",
              onTap: () => _launchURL(linkedin),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Function() onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xffff8383)),
        title: Text(
          title,
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.rubik(fontSize: 15),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
