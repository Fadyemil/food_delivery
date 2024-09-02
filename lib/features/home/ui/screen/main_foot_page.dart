import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/features/home/ui/widget/build_app_bar_main_foot_page.dart';
import 'package:food_delivery_app/features/home/ui/widget/most_meal.dart';

class MainFootPage extends StatelessWidget {
  const MainFootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const BuildAppBarMainFootPage(),
            SizedBox(height: 16.h),
            const MostMeal(),
          ],
        ),
      ),
    );
  }
}
