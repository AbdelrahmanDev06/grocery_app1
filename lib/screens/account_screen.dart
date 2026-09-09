import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/account_info.dart';
import 'package:flutter_application_1/widgets/account_option.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          AccountInfo(),
          SizedBox(height: 20),
          Divider(),
          AccountOption(icon: Icons.breakfast_dining_outlined, text: "orders"),
          AccountOption(icon: Icons.details, text: "my details"),
          AccountOption(
            icon: Icons.delivery_dining_outlined,
            text: "delivery details",
          ),
          AccountOption(
            icon: Icons.notification_add_outlined,
            text: "Notifications",
          ),
          AccountOption(
            icon: Icons.credit_card_off_outlined,
            text: "PaymentMethods",
          ),
          AccountOption(
            icon: Icons.airplane_ticket_outlined,
            text: "Promocode",
          ),
          AccountOption(icon: Icons.question_mark_outlined, text: "Help"),
        ],
      ),
    );
  }
}
