import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  double price;

  ProductItem({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      // height: 148,
      padding: EdgeInsets.only(top: 25, right: 15, left: 15, bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE2E2E2)),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/images/product.png')),
          SizedBox(height: 30),
          Text(
            "Red Apple ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Text("1kg, Price", style: TextStyle(color: Color(0xff7C7C7C))),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ $price",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Color(0xff53B175),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(Icons.add, color: Colors.white, size: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
