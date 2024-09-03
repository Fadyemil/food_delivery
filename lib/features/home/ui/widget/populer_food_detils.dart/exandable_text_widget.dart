import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/widget/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  const ExpandableTextWidget({super.key, required this.text});
  final String text;

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  int textLimit = 100; // عدد الحروف التي نريد إظهارها في القسم الأول.

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textLimit) {
      firstHalf = widget.text.substring(0, textLimit);
      secondHalf = widget.text.substring(textLimit, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              data: firstHalf,
              overflowText: false,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SmallText(
                  overflowText: false,
                  data: hiddenText
                      ? (firstHalf + "...")
                      : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                    log(hiddenText.toString());
                  },
                  child: Row(
                    children: [
                      SmallText(
                        data: hiddenText ? 'Show more' : 'Show less',
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
