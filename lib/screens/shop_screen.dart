import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_search_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/widgets/home_slider.dart';
import 'package:flutter_application_1/widgets/product_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

            Row(
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
            SizedBox(height: 20),
            HomeSearchField(),
            SizedBox(height: 20),
            HomeSlider(),
            SizedBox(height: 20),

            SizedBox(
              height: 270,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  print(index);
                  return ProductItem(price: 4 + index.toDouble());
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
