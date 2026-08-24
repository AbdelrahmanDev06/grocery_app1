import "package:flutter/material.dart";

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 28.42),

        Center(child: Image.asset('assets/images/carrot.png')),

        SizedBox(height: 100.2),

        Text(
          "Login",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Color(0xFF123456),
          ),
        ),

        SizedBox(height: 10),

        Text("Enter your email and password", style: TextStyle(fontSize: 16)),

        SizedBox(height: 50),
      ],
    );
  }
}
