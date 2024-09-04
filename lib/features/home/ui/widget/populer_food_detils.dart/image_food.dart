// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/app_constants.dart';
import 'package:food_delivery_app/features/home/data/models/popular_product_Model.dart';

class imagefood extends StatelessWidget {
  const imagefood({
    super.key,
    required this.products,
  });
  final Products products;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image:
              NetworkImage(AppConstants.baseUrl + "uploads/" + products.img!),
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xffF7F7F7),
            Color(0xffF0F0F0),
          ],
        ),
      ),
    );
  }
}
