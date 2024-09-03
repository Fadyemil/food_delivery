import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/core/widget/icon_and_text.dart';
import 'package:food_delivery_app/core/widget/small_text.dart';

class BasicDataFood extends StatelessWidget {
  const BasicDataFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          data: 'Chinese Side',
          // size: 22.sp,
        ),
        SizedBox(height: 8.h),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15.sp,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            SmallText(data: '4'),
            SizedBox(width: 8.w),
            SmallText(data: '1287'),
            SizedBox(width: 4.w),
            SmallText(data: 'comments'),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            IconAndText(
              icon: Icons.access_time_rounded,
              text: '32min',
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
