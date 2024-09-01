import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class imageContainer extends StatelessWidget {
  const imageContainer({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      margin: EdgeInsets.only(left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: index.isEven ? Color(0xff36c5df) : Color(0xff9294cc),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/image/food0.png'),
        ),
      ),
    );
  }
}
