import 'package:flutter/material.dart';

class AccountOption extends StatelessWidget {
  final String text;
  final IconData icon;

  const AccountOption({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          children: [
            Icon(Icons.breakfast_dining_outlined),
            SizedBox(width: 20),

            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            Icon(Icons.arrow_forward_ios, size: 17),
          ],
        ),
        SizedBox(height: 15),
        Divider(),
      ],
    );
  }
}
