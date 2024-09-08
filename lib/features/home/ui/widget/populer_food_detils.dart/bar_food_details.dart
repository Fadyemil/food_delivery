import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/extensions.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/app_icon.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/features/home/logic/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/features/home/ui/screen/cart_page.dart';
import 'package:get/get.dart';

class BarFoodDetails extends StatelessWidget {
  const BarFoodDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIcon(
          icon: Icons.arrow_back_ios,
          onPressed: () {
            context.pop();
          },
        ),
        Spacer(),
        GetBuilder<PopularProductController>(builder: (controller) {
          return Stack(
            children: [
              AppIcon(
                  onPressed: () {
                    context.push(
                      CartPage(),
                    );
                  },
                  icon: Icons.shopping_cart_outlined),
              if (Get.find<PopularProductController>().totalItems >= 1)
                Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 10.r,
                      backgroundColor: AppColors.mainColor,
                    ))
              else
                Container(),
              if (Get.find<PopularProductController>().totalItems >= 1)
                Positioned(
                  right: 2.5,
                  top: 0.5,
                  child: BigText(
                    data: Get.find<PopularProductController>()
                        .totalItems
                        .toString(),
                    // color: Colors.white,
                    size: 12,
                  ),
                )
              else
                Container(),
            ],
          );
        })
      ],
    );
  }
}
