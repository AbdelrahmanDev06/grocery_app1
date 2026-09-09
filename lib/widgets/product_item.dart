import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/screens/product_detail_screen.dart';
import 'cart_manager.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.only(top: 25, right: 15, left: 15, bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE2E2E2)),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
            child: Center(child: Image.asset(product.image)),
          ),
          SizedBox(height: 30),
          Text(
            product.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Text(product.description, style: TextStyle(color: Color(0xff7C7C7C))),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${product.price}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  CartManager.instance.addItem(
                    product.title,
                    product.description,
                    product.price,
                    product.image,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Color(0xff53B175),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 17),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
