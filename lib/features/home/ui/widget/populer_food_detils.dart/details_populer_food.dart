import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/features/home/data/models/popular_product_Model.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/basic_data_food.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/exandable_text_widget.dart';

class DetailsPopulerFood extends StatelessWidget {
  const DetailsPopulerFood({
    super.key,
    required this.products,
  });
  final Products products;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BasicDataFood(),
          SizedBox(height: 16.h),
          BigText(
            data: 'Introduce',
            size: 16,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ExpandableTextWidget(text: products.description!),
            ),
          )
        ],
      ),
    );
  }
}
