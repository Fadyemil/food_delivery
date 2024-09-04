import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:food_delivery_app/core/helpers/extensions.dart';
import 'package:food_delivery_app/core/utils/app_constants.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/core/widget/icon_and_text.dart';
import 'package:food_delivery_app/core/widget/small_text.dart';
import 'package:food_delivery_app/features/home/data/models/popular_product_Model.dart';
import 'package:food_delivery_app/features/home/ui/screen/recommended_food_detail.dart';
import 'package:get/get.dart';

class PopularFoodItem extends StatelessWidget {
  const PopularFoodItem({super.key, required this.products});
  final Products products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            RecommendedFoodDetail(
              products: products,
            ),
            transition: Transition.leftToRight);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
        child: Row(
          children: [
            Flexible(
              // flex: 1,
              child: Container(
                height: 120.h,
                width: 120.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white38,
                  image: DecorationImage(
                    image: NetworkImage(
                        AppConstants.baseUrl + "uploads/" + products.img!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 4.w),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(data: products.name!),
                  SizedBox(height: 4.h),
                  SmallText(data: (products.description!)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconAndText(
                          icon: Icons.circle_sharp,
                          text: 'Normal',
                          iconColor: AppColors.iconColor1,
                        ),
                        SizedBox(width: 8.w),
                        IconAndText(
                          icon: Icons.location_on_outlined,
                          text: '1.7Km',
                          iconColor: AppColors.mainColor,
                        ),
                        SizedBox(width: 8.w),
                        Flexible(
                          child: IconAndText(
                            icon: Icons.access_time_rounded,
                            text: '32min',
                            iconColor: AppColors.iconColor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
