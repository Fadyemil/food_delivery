import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/bar_bottom_details_food_page.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/bar_food_details.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/details_populer_food.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/image_food.dart';

class PopulerFoodDetails extends StatelessWidget {
  const PopulerFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned(
            left: 0,
            right: 0,
            child: imagefood(),
          ),
          Positioned(
            top: 45.h,
            left: 20.w,
            right: 20.w,
            child: BarFoodDetails(),
          ),
          Positioned(
            top: 350.h - 20.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: DetailsPopulerFood(),
          )
        ],
      ),
      bottomNavigationBar: BarBottomDetailsFoodPage(),
    );
  }
}
