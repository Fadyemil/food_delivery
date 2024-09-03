import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/app_icon.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';

class BottomBarRecoFoodDetails extends StatelessWidget {
  const BottomBarRecoFoodDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                icon: Icons.remove,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
              ),
              BigText(
                data: '\$12.88' + ' X ' + ' 0 ',
                color: AppColors.mainBlackColor,
              ),
              AppIcon(
                icon: Icons.add,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.mainColor,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  // color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 5,
              child: Container(
                // padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                width: 220.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: BigText(
                    data: "\$10 | add to cart",
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
