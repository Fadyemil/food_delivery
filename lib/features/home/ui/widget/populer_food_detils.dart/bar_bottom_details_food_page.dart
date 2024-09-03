import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';

class BarBottomDetailsFoodPage extends StatelessWidget {
  const BarBottomDetailsFoodPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
        color: AppColors.buttonBackgroundColor,
      ),
      child: Row(
        children: [
          Container(
            width: 75.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    )),
                BigText(data: '0'),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: AppColors.signColor,
                    ))
              ],
            ),
          ),
          Spacer(),
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
      ),
    );
  }
}
