// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigText extends StatelessWidget {
  BigText({
    super.key,
    required this.data,
    this.color = const Color(0xff332d2b),
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  });
  final String data;
  Color? color;
  double size;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
        fontSize: size.sp,
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
    );
  }
}
