import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/cart_manager.dart';
import 'package:flutter_application_1/screens/order_accepted_screen.dart';

void showCheckoutSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const CheckoutSheet(),
  );
}

class CheckoutSheet extends StatelessWidget {
  const CheckoutSheet({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF53B175);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Checkout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          _CheckoutRow(label: 'Delivery', value: 'Select Method'),
          const Divider(),
          _CheckoutRow(label: 'Payment', value: '', showCardIcon: true),
          const Divider(),
          _CheckoutRow(label: 'Promo Code', value: 'Pick discount'),
          const Divider(),
          _CheckoutRow(
            label: 'Total Cost',
            value: '\$${CartManager.instance.total.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              children: [
                const TextSpan(text: 'By placing an order you agree to our\n'),
                TextSpan(
                  text: 'Terms And Conditions',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderAcceptedScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Place Order',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckoutRow extends StatelessWidget {
  final String label;
  final String value;
  final bool showCardIcon;

  const _CheckoutRow({
    required this.label,
    required this.value,
    this.showCardIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),
          Row(
            children: [
              if (showCardIcon) ...[
                const Icon(Icons.credit_card, size: 20, color: Colors.blue),
                const SizedBox(width: 8),
              ],
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
