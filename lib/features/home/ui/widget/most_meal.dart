import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:food_delivery_app/core/helpers/extensions.dart';
import 'package:food_delivery_app/core/routes/route_helper.dart';
import 'package:food_delivery_app/features/home/logic/controllers/popular_product_controller.dart';
// import 'package:food_delivery_app/core/helpers/extensions.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
// import 'package:food_delivery_app/features/home/ui/screen/populer_food_details.dart';
import 'package:food_delivery_app/features/home/ui/widget/deatils_meal.dart';
import 'package:food_delivery_app/features/home/ui/widget/imageContainer.dart';
import 'package:get/get.dart';
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
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: popularProducts.popularProductList.length,
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.popularFoodDetail, arguments: {
                    'products': popularProducts.popularProductList[index],
                  });
                },
                child: Stack(
                  children: [
                    imageContainer(
                      index: index,
                      productModel: popularProducts.popularProductList[index],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: DetailsMeal(
                        index: index,
                        productModel: popularProducts.popularProductList[index],
                      ),
                    ),
                  ],
                ),
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
          );
        }),
        SizedBox(height: 16.h), // Space between carousel and indicators
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: popularProducts.popularProductList.isEmpty
                  ? 1
                  : popularProducts.popularProductList.length,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.mainColor,
                dotHeight: 8.h,
                dotWidth: 8.h,
                spacing: 4.w,
              ),
              onDotClicked: (index) {
                _carouselController.animateToPage(index);
              },
            );
          },
        ),
      ],
    );
  }
}
