import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/core/widget/icon_and_text.dart';
import 'package:food_delivery_app/core/widget/small_text.dart';

class deatilsMeal extends StatelessWidget {
  const deatilsMeal({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2.0,
            offset: Offset(0.0, 1.0),
            blurRadius: 5.0,
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(top: 10.h, left: 15.h, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(data: 'Chinese Side ${index}'),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: List.generate(
                    5,
                    (index) {
                      return Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15.h,
                      );
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                SmallText(
                  data: '4.5',
                ),
                SizedBox(width: 10.w),
                SmallText(
                  data: '1287',
                ),
                SizedBox(width: 5.w),
                SmallText(
                  data: 'comments',
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                IconAndText(
                  icon: Icons.circle_sharp,
                  text: 'Normal',
                  iconColor: AppColors.iconColor1,
                ),
                SizedBox(width: 10.w),
                IconAndText(
                  icon: Icons.location_on_outlined,
                  text: '1.7Km',
                  iconColor: AppColors.mainColor,
                ),
                SizedBox(width: 10.w),
                IconAndText(
                  icon: Icons.access_time_rounded,
                  text: '32min',
                  iconColor: AppColors.iconColor2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
