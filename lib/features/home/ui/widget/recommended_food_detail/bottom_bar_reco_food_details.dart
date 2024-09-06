import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/app_icon.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/features/home/data/models/popular_product_Model.dart';
import 'package:food_delivery_app/features/home/logic/controllers/popular_product_controller.dart';
import 'package:get/get.dart';

class BottomBarRecoFoodDetails extends StatelessWidget {
  const BottomBarRecoFoodDetails({
    super.key,
    required this.products,
  });
  final Products products;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder: (controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  onPressed: () {
                    controller.setQuantity(false);
                  },
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  data: '\$ ${products.price} ' +
                      ' X ' +
                      '${controller.inCartItems}',
                  color: AppColors.mainBlackColor,
                ),
                AppIcon(
                  onPressed: () {
                    controller.setQuantity(true);
                  },
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
                child: InkWell(
                  onTap: () {
                    controller.addItem(products);
                  },
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
                        data: "\$${products.price} | add to cart",
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
