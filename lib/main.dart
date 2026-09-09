import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_application_1/screens/bottom_nav_bar_screen.dart';
import 'package:flutter_application_1/screens/cart_screen.dart';
import 'package:flutter_application_1/screens/shop_screen.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:flutter_application_1/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/splash',

      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const RegisterScreen(),
        '/home': (context) => const BottomNavBarScreen(),
        '/cart': (context) => const CartScreen(),
        '/register': (context) => const RegisterScreen(),
        '/shop': (context) => const ShopScreen(),
      },
    );
  }
}
