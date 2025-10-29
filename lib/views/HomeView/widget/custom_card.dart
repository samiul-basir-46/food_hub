import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:foodshop/controller/list_controller.dart';
import 'package:foodshop/model/product_model.dart';
import 'package:foodshop/routes/route_names.dart';
import 'package:foodshop/utils/colors.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final String text, price, image;
  final void Function()? onTapFav, onTapAdd;
  final bool? isColor;
  final Color? color;
  final void Function()? onTapBasket;
  final ListController listController = Get.find<ListController>();
  final Product product;

  CustomCard({
    super.key,
    required this.text,
    required this.price,
    this.onTapFav,
    this.onTapAdd,
    required this.image,
    this.isColor,
    this.color,
    required this.product, this.onTapBasket,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(
      () => Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
        width: screenWidth * 0.4,
        decoration: BoxDecoration(
          color: isColor == true ? color : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(40),
              spreadRadius: 0,
              blurRadius: 19,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: InkWell(
                  onTap: onTapFav,
                  child: Icon(
                    listController.isFavorite(product)
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Colors.orange,
                    size: 25,
                  ).paddingOnly(top: 10),
                ),
              ),

              const SizedBox(height: 10),
              InkWell(
                onTap: onTapBasket,
                child: Column(
                  children: [
                    Image.asset(
                      product.image.isNotEmpty
                          ? product.image
                          : "assets/images/no_image.png",
                      height: 80,
                      width: 80,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 8),
                    AutoSizeText(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.price,
                    style: const TextStyle(color: Colors.orange, fontSize: 16),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFF2E7),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: onTapAdd,
                        child: Icon(Icons.add, color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
