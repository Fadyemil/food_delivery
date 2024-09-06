import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/features/home/data/models/popular_product_Model.dart';
import 'package:food_delivery_app/features/home/logic/controllers/cart_controllers.dart';
import 'package:food_delivery_app/features/home/logic/controllers/popular_product_controller.dart';
import 'package:get/get.dart';

class BarBottomDetailsFoodPage extends StatefulWidget {
  const BarBottomDetailsFoodPage({
    super.key,
    required this.product,
  });
  final Products product;

  @override
  State<BarBottomDetailsFoodPage> createState() =>
      _BarBottomDetailsFoodPageState();
}

class _BarBottomDetailsFoodPageState extends State<BarBottomDetailsFoodPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.isRegistered<CartControllers>()) {
        Get.find<CartControllers>().getQuantity(widget.product);
        Get.find<PopularProductController>().initProduct(
            cart: Get.find<CartControllers>(), product: widget.product);
      } else {
        log("*********************CartControllers is not registered.*************");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder: (popularProduct) {
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
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          popularProduct.setQuantity(false);
                        },
                        icon: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        )),
                    BigText(data: popularProduct.inCartItems.toString()),
                    IconButton(
                        onPressed: () {
                          popularProduct.setQuantity(true);
                        },
                        icon: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ))
                  ],
                ),
              ),
            ),
            Spacer(),
            Flexible(
              flex: 5,
              child: Container(
                width: 220.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      popularProduct.addItem(widget.product);
                    },
                    child: BigText(
                      data: "\$${widget.product.price} | add to cart",
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
