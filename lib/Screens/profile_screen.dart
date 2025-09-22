import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui_firebase_auth/Components/head_title.dart';
import 'package:login_ui_firebase_auth/Screens/welcome_screen.dart';
import 'package:login_ui_firebase_auth/Components/spin_kit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  String? selectedGender;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();

    if (!doc.exists) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User profile not found")));
      return;
    }

    final data = doc.data();
    if (data != null) {
      setState(() {
        nameController.text = data['name'] ?? '';
        ageController.text = data['age'].toString();
        addressController.text = data['address'] ?? '';
        selectedGender = data['gender'];
        emailController.text = currentUser.email ?? '';
        isLoading = false;
      });
    }
  }

  Future<void> updateUserData() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({
            'name': nameController.text.trim(),
            'age': int.tryParse(ageController.text.trim()),
            'address': addressController.text.trim(),
            'gender': selectedGender,
          });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
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

  Widget buildTextField({
    required Icon formIcon,
    required String label,
    required TextEditingController controller,
    bool readOnly = false,
    TextInputType inputType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          TextFormField(
            controller: controller,
            readOnly: readOnly,
            keyboardType: inputType,
            validator: (value) =>
                value == null || value.isEmpty ? 'Please enter $label' : null,
            decoration: InputDecoration(
              suffixIcon: formIcon,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              hintText: "Enter your $label",
              hintStyle: GoogleFonts.rubik(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGenderField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          DropdownButtonFormField<String>(
            value: selectedGender,
            icon: Padding(
              padding: EdgeInsetsGeometry.only(right: 8),
              child: const Icon(Icons.wc),
            ),
            items: ['Male', 'Female'].map((gender) {
              return DropdownMenuItem(value: gender, child: Text(gender));
            }).toList(),
            onChanged: (value) {
              setState(() => selectedGender = value);
            },
            validator: (value) =>
                value == null || value.isEmpty ? 'Please select gender' : null,
            decoration: InputDecoration(
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

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(appBar: AppBar(),
            backgroundColor:Theme.of(context).scaffoldBackgroundColor,
            body: Center(child: SpinKitItem()),
          )
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),

            child: Scaffold(appBar: AppBar(),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: SafeArea(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: HeadTitle(title: "Profile", lineWidth: 60),
                        ),
                        const SizedBox(height: 30),
                        buildTextField(
                          formIcon: const Icon(Icons.person_2_outlined),
                          label: 'Name',
                          controller: nameController,
                        ),
                        buildTextField(
                          formIcon: const Icon(Icons.numbers),
                          label: 'Age',
                          controller: ageController,
                          inputType: TextInputType.number,
                        ),
                        buildTextField(
                          formIcon: const Icon(Icons.location_on_outlined),
                          label: 'Address',
                          controller: addressController,
                        ),
                        buildGenderField(),
                        buildTextField(
                          formIcon: const Icon(Icons.mail_outline),
                          label: 'Email (read only)',
                          controller: emailController,
                          readOnly: true,
                        ),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: GestureDetector(
                            onTap: updateUserData,
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Update",
                                  style: GoogleFonts.rubik(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: GestureDetector(
                            onTap: signOut,
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade300,
                              ),
                              child: Center(
                                child: Text(
                                  "Sign Out",
                                  style: GoogleFonts.rubik(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
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
}

