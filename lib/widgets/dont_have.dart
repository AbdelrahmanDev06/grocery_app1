import 'package:flutter/material.dart';

class DontHave extends StatelessWidget {
  const DontHave({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: Color(0xFF181725)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: Text(" Sign Up", style: TextStyle(color: Color(0xFF53B175))),
        ),
      ],
    );
  }
}
