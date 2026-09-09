import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/widgets/home_search_field.dart';

import 'package:flutter_application_1/widgets/home_slider.dart';
import 'package:flutter_application_1/widgets/product_item.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.27),
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(child: Image.asset("assets/images/carrot.png", width: 30)),
            SizedBox(height: 7.6),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Text(
                  "Egypt , Giza",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff4c4F4D),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const HomeSearchField(),
            const SizedBox(height: 20),
            const HomeSlider(),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Exclusive Offer",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 270,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  print(index);
                  return ProductItem(product: products[index]);
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<ProductModel> products = [
  ProductModel(
    image: "assets/images/apple.png",
    title: "RedApple",
    description: "1kg , priceg",
    price: 4.99,
  ),
  ProductModel(
    image: "assets/images/beef.png",
    title: "Beef Bone",
    description: "1kg , priceg",
    price: 5.99,
  ),
  ProductModel(
    image: "assets/images/apple.png",
    title: "RedApple",
    description: "1kg , priceg",
    price: 5.99,
  ),
  ProductModel(
    image: "assets/images/chicken.png",
    title: "Chicken",
    description: "1kg , priceg",
    price: 5.99,
  ),
];
