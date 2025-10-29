import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:foodshop/views/OnboardingView/widget/custom_onboard.dart';
import 'package:get/get.dart';
import '../../routes/route_names.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomOnboard(image: 'assets/images/onboarding_1.png'),
            SizedBox(height: screenHeight * 0.05),
            CustomText(
              text: "Get The Freshest Fruit Salad Combo",
              fontWeight: FontWeight.w700,
            ).paddingSymmetric(horizontal: 20),
            SizedBox(height: 5),
            AutoSizeText(
              'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
              maxLines: 2,
              maxFontSize: 16,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ).paddingSymmetric(horizontal: 20),
            SizedBox(height: screenHeight * 0.08),
            CustomButton(
              text: "Let's Started",
              onTap: () => Get.toNamed(RouteNames.onBoard2),
            ),
            SizedBox(height: screenHeight * 0.1),
          ],
        ),
      ),
    );
  }
}
