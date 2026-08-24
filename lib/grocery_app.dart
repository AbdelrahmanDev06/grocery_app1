import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/bottom_nav_bar_screen.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BottomNavBarScreen());
  }
}
