import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/core/widget/icon_and_text.dart';
import 'package:food_delivery_app/core/widget/small_text.dart';

class DetailsMeal extends StatelessWidget {
  const DetailsMeal({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 130.h,
      width: 195.w,
      margin: EdgeInsets.only(
        top: 7.h,
        bottom: 7.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2.r,
            offset: Offset(0.w, 1.h),
            blurRadius: 5.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(data: 'Chinese Side $index'),
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }
}
