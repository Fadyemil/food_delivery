import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/core/widget/small_text.dart';
import 'package:food_delivery_app/features/home/logic/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/features/home/ui/widget/build_app_bar_main_foot_page.dart';
import 'package:food_delivery_app/features/home/ui/widget/most_meal.dart';
import 'package:food_delivery_app/features/home/ui/widget/popular_foodItem.dart';
import 'package:food_delivery_app/features/home/ui/widget/sliver_app_bar_delegate.dart';
import 'package:get/get.dart';

class MainFootPage extends StatelessWidget {
  const MainFootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const BuildAppBarMainFootPage(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  MostMeal(),
                  SizedBox(height: 16.h),
                ],
              ), // Keep MostMeal in the scroll view
            ),
            SliverPersistentHeader(
              delegate: SliverAppBarDelegate(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  color: Colors.white, // Background color for the header
                  child: Row(
                    children: [
                      BigText(data: 'Recommended'),
                      SizedBox(width: 16.w),
                      SmallText(data: 'Food pairing'),
                    ],
                  ),
                ),
              ),
              pinned: true, // Keep the header visible when scrolling
            ),
            GetBuilder<RecommendedProductController>(builder: (recommended) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PopularFoodItem(
                    products: recommended.recommendedProductList[index],
                  ),
                  childCount: recommended.recommendedProductList
                      .length, // Number of items in your list
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
