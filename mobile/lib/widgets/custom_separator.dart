import 'package:flutter/material.dart';
import 'package:music_roster/constants/app_colors.dart';

class CustomSeparator extends StatelessWidget {
  final Color color;
  const CustomSeparator({super.key, this.color = AppColors.lightGrey});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color),
      height: 1,
      width: double.infinity,
    );
  }
}
