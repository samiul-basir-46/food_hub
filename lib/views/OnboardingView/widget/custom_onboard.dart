import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CustomOnboard extends StatelessWidget {
  final String image;

  const CustomOnboard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        top: screenHeight * 0.15,
        bottom: screenHeight * 0.01,
      ),
      height: screenHeight * 0.6,
      width: double.infinity,
      color: AppColors.primaryColor,
      child: Center(
        child: Image.asset(
          image,
          height: screenHeight * 0.7,
          width: screenWidth * 0.8,
        ),
      ),
    );
  }
}
