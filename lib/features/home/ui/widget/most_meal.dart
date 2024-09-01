import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/features/home/ui/widget/deatils_meal.dart';
import 'package:food_delivery_app/features/home/ui/widget/imageContainer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MostMeal extends StatefulWidget {
  const MostMeal({super.key});

  @override
  _MostMealState createState() => _MostMealState();
}

class _MostMealState extends State<MostMeal> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return Stack(
              children: [
                imageContainer(index: index),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: deatilsMeal(index: index),
                ),
              ],
            );
          },
          options: CarouselOptions(
            height: 320.h,
            viewportFraction: 0.8,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 16.h), // Space between carousel and indicators
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: 5,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.mainColor,
            dotHeight: 8.h,
            dotWidth: 8.h,
            spacing: 4.w,
          ),
          onDotClicked: (index) {
            _carouselController.animateToPage(index);
          },
        ),
      ],
    );
  }
}
