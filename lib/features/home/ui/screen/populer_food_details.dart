// populer_food_details.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/features/home/data/models/popular_product_Model.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/bar_bottom_details_food_page.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/bar_food_details.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/details_populer_food.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/image_food.dart';

class PopulerFoodDetails extends StatelessWidget {
  final Products products;

  const PopulerFoodDetails({
    Key? key,
    required this.products, // Ensure 'products' is a required named parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: imagefood(products: products),
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
            child: DetailsPopulerFood(
              products: products,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BarBottomDetailsFoodPage(
        product: products,
      ),
    );
  }
}
