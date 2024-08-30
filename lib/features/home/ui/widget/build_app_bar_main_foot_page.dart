import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/core/widget/small_text.dart';

class BuildAppBarMainFootPage extends StatelessWidget {
  const BuildAppBarMainFootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h),
        Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BigText(
                    data: 'Egypt',
                    color: AppColors.mainColor,
                  ),
                  Row(
                    children: [
                      SmallText(
                        data: 'Sohag',
                        color: AppColors.mainBlackColor,
                      ),
                      Icon(Icons.arrow_drop_down_rounded)
                    ],
                  ),
                ],
              ),
              Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.mainColor,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
