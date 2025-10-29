import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:foodshop/controller/home_controller.dart';
import 'package:foodshop/controller/list_controller.dart';
import 'package:foodshop/controller/text_controller.dart';
import 'package:foodshop/model/product_model.dart';
import 'package:foodshop/utils/colors.dart';
import 'package:get/get.dart';

class AddBasketView extends StatelessWidget {
  AddBasketView({super.key});

  final IncrementController incrementController = Get.put(
    IncrementController(),
  );
  final IconController iconController = Get.find<IconController>();
  final HomeController homeController = Get.find<HomeController>();
  final ListController listController = Get.find<ListController>();

  final product = Get.arguments as Product;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight * 1,
        width: double.infinity,
        color: AppColors.primaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 6,
                      bottom: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Text(
                          "Go back",
                          style: TextStyle(fontSize: 16),
                        ).paddingOnly(top: 2),
                      ],
                    ),
                  ),
                ),
              ).paddingOnly(left: 20),
              SizedBox(height: screenHeight * 0.02),
              Image.asset(
                product.image.isNotEmpty
                    ? product.image
                    : "assets/images/no_image.png",
                height: screenHeight * 0.2,
                width: screenWidth * 0.6,
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                height: screenHeight * 0.66,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.04),
                      AutoSizeText(
                        product.name,
                        minFontSize: 27,
                        maxFontSize: 35,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ).paddingSymmetric(horizontal: 20),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  incrementController.decrement();
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove_rounded,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 25),
                              Obx(
                                () => AutoSizeText(
                                  "${incrementController.count.value}",
                                  minFontSize: 18,
                                  maxFontSize: 27,
                                  style: TextStyle(fontSize: 24),
                                ).paddingOnly(top: 3),
                              ),
                              const SizedBox(width: 25),
                              InkWell(
                                onTap: () {
                                  incrementController.increment();
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFFFF2E8),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            product.price,
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF27214D),
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20),
                      SizedBox(height: screenHeight * 0.02),
                      Divider(color: Color(0xFFD8D8D8)),
                      SizedBox(height: screenHeight * 0.02),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: IntrinsicWidth(
                          child: Column(
                            children: [
                              Text(
                                "One Pack Contains:",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                height: 2,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 20),
                      SizedBox(height: screenHeight * 0.02),
                      AutoSizeText(
                        "Red Quinoa,Lime,Honey,Blueberries,Strawberries,Mango,Fresh Mint.",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ).paddingSymmetric(horizontal: 20),
                      SizedBox(height: screenHeight * 0.02),
                      Divider(color: Color(0xFFD8D8D8)),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: AutoSizeText(
                              maxLines: 2,
                              "If you are looking for a new fruit salad to eat today,quinoa is the perfect brunch fo you. make",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Flexible(flex: 1, child: SizedBox()),
                        ],
                      ).paddingSymmetric(horizontal: 20),
                      SizedBox(height: screenHeight * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => InkWell(
                              onTap: () =>
                                  listController.toggleFavorite(product),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFFfff7f0),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    listController.isFavorite(product)
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              bool isAdded = homeController
                                  .addToBasketWithQuantity(
                                    product,
                                    incrementController.count.value,
                                  );

                              if (isAdded) {
                                Get.snackbar(
                                  "",
                                  "",
                                  colorText: Colors.black,
                                  titleText: const Text(
                                    "Item Added Successfully",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green,
                                    ),
                                  ),
                                  messageText: Text(
                                    "Quantity: ${incrementController.count.value}",
                                  ),
                                  icon: const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                );
                              } else {
                                Get.snackbar(
                                  "",
                                  "",
                                  colorText: Colors.black,
                                  titleText: const Text(
                                    "Item Already in Basket",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                                  messageText: Text(
                                    "You can modify quantity in the basket.",
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 70,
                              width: screenWidth * 0.6,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Add to Basket",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20, vertical: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
