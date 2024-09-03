// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  AppIcon(
      {super.key,
      this.onPressed,
      required this.icon,
      this.backgroundColor = const Color(0xfffcf4e4),
      this.size = 40,
      this.iconColor = const Color(0xff756d54)});
  final IconData icon;
  final Color backgroundColor;
  final double size;
  final Color iconColor;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }
}
