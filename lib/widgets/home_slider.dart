import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 119.0,
            autoPlay: true,
            viewportFraction: 1.0,
            onPageChanged: (i, r) {
              setState(() {
                activeIndex = i;
              });
            },
            enableInfiniteScroll: false,
          ),
          items: images
              .map(
                (i) => Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.network(i).image,
                    ),
                  ),
                ),
              )
              .toList(),
        ),

        Positioned(
          bottom: 10,

          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: images.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Color(0xff53B175),
              dotColor: Colors.grey,
              dotWidth: 10,
              dotHeight: 10,
              spacing: 4,
            ),
          ),
        ),
      ],
    );
  }
}

List<String> images = [
  "https://media.istockphoto.com/id/1318452948/photo/large-variety-of-food-on-black-background.webp?s=612x612&w=is&k=20&c=rTK6BphtZ04xp4HmceEeoEiSj43PN7i2xcb1wK9-Z88=",
  "https://media.istockphoto.com/id/1449032425/photo/shopping-bag-full-of-healthy-food-on-blue.jpg",
  "https://media.istockphoto.com/id/1318452948/photo/large-variety-of-food-on-black-background.webp?s=612x612&w=is&k=20&c=rTK6BphtZ04xp4HmceEeoEiSj43PN7i2xcb1wK9-Z88=",
  "https://media.istockphoto.com/id/1449032425/photo/shopping-bag-full-of-healthy-food-on-blue.jpg",
];
