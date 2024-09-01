import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/widget/small_text.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });
  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: 5.w,
        ),
        SmallText(
          data: text,
        )
      ],
    );
  }
}
