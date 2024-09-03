import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class imagefood extends StatelessWidget {
  const imagefood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/image/food0.png'),
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
