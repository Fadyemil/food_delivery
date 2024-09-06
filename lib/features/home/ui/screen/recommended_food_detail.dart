import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/app_constants.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/features/home/data/models/popular_product_Model.dart';
import 'package:food_delivery_app/features/home/logic/controllers/cart_controllers.dart';
import 'package:food_delivery_app/features/home/logic/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/bar_food_details.dart';
import 'package:food_delivery_app/features/home/ui/widget/recommended_food_detail/bottom_bar_reco_food_details.dart';
import 'package:food_delivery_app/features/home/ui/widget/recommended_food_detail/des_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatefulWidget {
  const RecommendedFoodDetail({super.key, required this.products});
  final Products products;

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.isRegistered<CartControllers>()) {
        Get.find<CartControllers>().getQuantity(widget.products);
        Get.find<PopularProductController>().initProduct(
            cart: Get.find<CartControllers>(), product: widget.products);
      } else {
        log("*********************CartControllers is not registered.*************");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70.h,
            title: const BarFoodDetails(),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.h),
              child: Container(
                child: Center(
                  child: BigText(data: widget.products.name!),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r),
                  ),
                  color: Colors.white,
                ),
                width: double.infinity,
                padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.baseUrl + "uploads/" + widget.products.img!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: DesWidget(
              products: widget.products,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBarRecoFoodDetails(
        products: widget.products,
      ),
    );
  }
}
