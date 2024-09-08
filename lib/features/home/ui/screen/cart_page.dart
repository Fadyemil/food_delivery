import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/app_constants.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/core/widget/small_text.dart';
import 'package:food_delivery_app/features/home/logic/controllers/cart_controllers.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/bar_food_details.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 45.h,
            left: 20.w,
            right: 20.w,
            child: BarFoodDetails(),
          ),
          Positioned(
            top: 100.h,
            left: 20.w,
            right: 20.w,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: 15.h),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: GetBuilder<CartControllers>(
                  builder: (cartControllse) {
                    return ListView.builder(
                      itemCount: cartControllse.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 100.h,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                width: 100.w,
                                height: 100.h,
                                margin: EdgeInsets.only(bottom: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(AppConstants.baseUrl +
                                        "uploads/" +
                                        cartControllse.getItems[index].img!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                  child: Container(
                                // height: 100.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                        data: cartControllse
                                            .getItems[index].name!),
                                    SmallText(data: 'Spicy'),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            data:
                                                "\$ ${cartControllse.getItems[index].price}",
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color: Colors.white,
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        // popularProduct.setQuantity(false);
                                                      },
                                                      icon: Icon(
                                                        Icons.remove,
                                                        color:
                                                            AppColors.signColor,
                                                      )),
                                                  BigText(data: '0'),
                                                  IconButton(
                                                    onPressed: () {
                                                      // popularProduct.setQuantity(true);
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
