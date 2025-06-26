import 'package:dots_indicator/dots_indicator.dart';
import 'package:finance_app/screens/app/home_page/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterCarousel(
          options: FlutterCarouselOptions(
            height: 263.h,
            padEnds: false,
            viewportFraction: 0.7,
            enlargeCenterPage: true,
            enlargeFactor: 0.15,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: [
            CardItem(
              cardName: 'X-',
              color: const Color(0xFF617AFD),
              cardNumber: '3434',
              cardBalance: '23400',
            ), // Red
            CardItem(
              cardName: 'M-',
              color: const Color(0xFF4151A6),
              cardNumber: '1234 5678 9012 3456',
              cardBalance: '4545',
            ), // Green
          ],
        ),
        SizedBox(height: 16.h),
        DotsIndicator(
          dotsCount: 2, // Match the number of items in carousel
          position: currentIndex.toDouble(),
          decorator: DotsDecorator(
            spacing: EdgeInsets.symmetric(horizontal: 4),
            color: Color(0xffE3E9ED),
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
