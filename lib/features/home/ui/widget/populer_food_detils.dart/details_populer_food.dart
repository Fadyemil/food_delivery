import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/widget/big_text.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/basic_data_food.dart';
import 'package:food_delivery_app/features/home/ui/widget/populer_food_detils.dart/exandable_text_widget.dart';

class DetailsPopulerFood extends StatelessWidget {
  const DetailsPopulerFood({
    super.key,
  });

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
              child: ExpandableTextWidget(
                  text:
                      "For C#, this theme is exactly the same Monokai's theme of Sublime Text but for Visual Studio Code instead. Unlike For C#, this theme is exactly the same Monokai's theme of Sublime Text but for Visual Studio Code instead. Unlike default C# VSCode's Monokai, this is an actual, perfect and identical copy of the loved by all Sublime Text's theme. It's name is Sublime Monokai.While I put special focus on making it identical specifically for C#, it is also close to identical in the case of C, C++ and Python. For other languages like Javascript, Ruby, Java, etc, it's not guaranteed to be 100% identical (or maybe yes, I didn't tested it), but it'll work anyway as just another Monokai theme :) Language's identicality support"),
            ),
          )
        ],
      ),
    );
  }
}
