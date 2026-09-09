import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/login_header.dart';
import "package:flutter_application_1/widgets/login_form.dart";
import "package:flutter_application_1/widgets/custom_button.dart";
import "package:flutter_application_1/widgets/dont_have.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeader(),
                LoginForm(),
                CustomButton(
                  text: "Login",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                ),

                SizedBox(height: 20),
                DontHave(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
