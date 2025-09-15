import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui_firebase_auth/Screens/welcome_screen.dart';
import 'package:login_ui_firebase_auth/state_management/cart_cubit.dart';
import 'package:login_ui_firebase_auth/state_management/categories_cubit.dart';
import 'package:login_ui_firebase_auth/state_management/products_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsCubit()..getProducts()),
        BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.white),
        primaryColor: Color(0xffff8383),
      ),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
