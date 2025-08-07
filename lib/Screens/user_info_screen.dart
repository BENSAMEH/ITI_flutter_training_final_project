import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui_firebase_auth/Screens/home_page.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [SizedBox(height: 80,),
                  Text(
                    "About You!",
                    style: GoogleFonts.rubik(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 6, bottom: 40),
                    color: const Color(0xffff8383),
                    width: 80,
                    height: 4,
                  ),

                  buildField("Name", nameController, "Enter your name"),
                  buildField(
                    "Age",
                    ageController,
                    "Enter your age",
                    inputType: TextInputType.number,
                  ),
                  buildField(
                    "Address",
                    addressController,
                    "Enter your address",
                  ),

                  const SizedBox(height: 20),
                  Text("Gender", style: GoogleFonts.rubik(fontSize: 20)),
                  DropdownButtonFormField<String>(
                    value: selectedGender,
                    items: ["Male", "Female"]
                        .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                        .toList(),
                    onChanged: (val) => setState(() => selectedGender = val),
                    validator: (val) =>
                        val == null ? "Please select gender" : null,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffff8383)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8383),
                      minimumSize: const Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: _saveUserInfo,
                    child: Text(
                      "Continue",
                      style: GoogleFonts.rubik(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Future<void> _saveUserInfo() async {
    if (_formKey.currentState!.validate()) {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "name": nameController.text.trim(),
          "age": int.tryParse(ageController.text.trim()),
          "address": addressController.text.trim(),
          "gender": selectedGender,
          "email": user.email,
          "uid": user.uid,
        });

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("User info saved")));

        // Navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ); // Replace with your actual route
      }
    }
  }
}
Widget buildField(
    String label,
    TextEditingController controller,
    String hint, {
      TextInputType inputType = TextInputType.text,
    }) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          validator: (value) => (value == null || value.isEmpty)
              ? "Please enter your $label"
              : null,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.rubik(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffff8383)),
            ),
          ),
        ),
      ],
    ),
  );
}
