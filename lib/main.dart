import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login_ui_firebase_auth/Screens/welcome_screen.dart';
import 'package:login_ui_firebase_auth/Theme/dark_theme.dart';
import 'package:login_ui_firebase_auth/Theme/light_theme.dart';
import 'package:login_ui_firebase_auth/state_management/cart_cubit.dart';
import 'package:login_ui_firebase_auth/state_management/categories_cubit.dart';
import 'package:login_ui_firebase_auth/state_management/products_cubit.dart';
import 'package:login_ui_firebase_auth/state_management/theme_cubit.dart'; // 👈 ضيف الكيوبت الجديد

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsCubit()..getProducts()),
        BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => ThemeCubit()), // 👈 ضيف ThemeCubit
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: const WelcomeScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
