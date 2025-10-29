import 'package:flutter/material.dart';
import 'package:foodshop/views/OnboardingView/widget/custom_onboard.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../controller/text_controller.dart';
import '../../routes/route_names.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_field.dart';

class OnboardingView2 extends StatelessWidget {
  OnboardingView2({super.key});

  final TextController controller = Get.find<TextController>();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingController.text = controller.userName.value;

    double screenHeight = MediaQuery.of(context).size.height;
    final formState = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomOnboard(image: 'assets/images/onboarding_2.png'),
            SizedBox(height: screenHeight * 0.05),
            CustomText(
              text: "What is your firstname?",
              fontWeight: FontWeight.w700,
            ).paddingSymmetric(horizontal: 20),
            SizedBox(height: 16),
            Form(
              key: formState,
              child: Column(
                children: [
                  CustomTextField(
                    controller: textEditingController,
                    isTrue: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Name";
                      } else {
                        return null;
                      }
                    },
                    hint: CustomText(
                      text: 'Tony',
                      color: Color(0xFFC2BDBD),
                      fontWeight: FontWeight.w400,
                    ).paddingSymmetric(horizontal: 20),
                  ).paddingSymmetric(horizontal: 20),
                  SizedBox(height: screenHeight * 0.08),
                  CustomButton(
                    text: "Start Ordering",
                    onTap: () {
                      if (formState.currentState!.validate()) {
                        controller.saveUserName(textEditingController.text);
                        final box = GetStorage();
                        box.write('isFirstTime', false);
                        Get.offAllNamed(RouteNames.home);
                      }
                    },
                  ),
                  SizedBox(height: screenHeight * 0.1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
