// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallText extends StatelessWidget {
  SmallText({
    super.key,
    required this.data,
    this.color = const Color(0xFFccc7c5),
    this.size = 12,
    this.height = 1.2,
  });
  final String data;
  Color? color;
  double size;
  double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size.sp,
        color: color,
        fontFamily: 'Roboto',
        height: height,
      ),
    );
  }
}
