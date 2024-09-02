import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/core/widget/small_text.dart';

class BuildAppBarMainFootPage extends StatelessWidget
    implements PreferredSizeWidget {
  const BuildAppBarMainFootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: kToolbarHeight + 15.h, // Increase the height if needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Ensures the Column takes minimal space
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
                    Icon(Icons.arrow_drop_down_rounded),
                  ],
                ),
              ],
            ),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 15.h);
}
