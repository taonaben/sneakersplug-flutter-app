import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  final List<String> imagePaths = [
    'lib/images/Adidas Futro Mixr.jpg',
    'lib/images/Air Jordan 11 Low Space Jam.jpg',
    'lib/images/Nike Kobe Mamba Fury.jpg',
    'lib/images/Puma Rihana.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: imagePaths.map((imagePath) {
            return Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 200,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          carouselController: _controller,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 185.0), //To Do: Fix this
            // Adjust the padding as needed
            child: AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: imagePaths.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Color.fromARGB(255, 35, 182, 255),
                dotColor: Colors.grey,
                dotHeight: 10,
                dotWidth: 10,
              ),
              onDotClicked: (index) {
                _controller.animateToPage(index);
              },
            ),
          ),
        ),
      ],
    );
  }
}
