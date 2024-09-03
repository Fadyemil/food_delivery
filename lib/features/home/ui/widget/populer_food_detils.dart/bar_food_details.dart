
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/helpers/extensions.dart';
import 'package:food_delivery_app/core/widget/app_icon.dart';

class BarFoodDetails extends StatelessWidget {
  const BarFoodDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIcon(
          icon: Icons.arrow_back_ios,
          onPressed: () {
            context.pop();
          },
        ),
        Spacer(),
        AppIcon(
          icon: Icons.shopping_cart_outlined,
        ),
      ],
    );
  }
}
