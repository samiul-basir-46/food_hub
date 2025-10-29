import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final double? height;

  const CustomButton({super.key, required this.text, this.onTap, this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ).paddingAll(16),
          ),
        ),
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
