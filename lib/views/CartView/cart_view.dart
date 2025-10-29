import 'package:flutter/material.dart';
import 'package:foodshop/controller/home_controller.dart';
import 'package:foodshop/widget/custom_button.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<Color> colors = [
      Color(0xFFFFFAEB),
      Color(0xFFFEF0F0),
      Color(0xFFF1EFF6),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.1,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text("My Basket"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        leading: Align(
          alignment: AlignmentDirectional.center,
          child: InkWell(
            onTap: () => Get.back(),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
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
        ),
        leadingWidth: 120,
      ),
      body: SafeArea(
        child: Obx(
          () => homeController.basketList.isEmpty
              ? Center(child: Text("No BasketList yet"))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: homeController.basketList.length,
                        itemBuilder: (context, index) {
                          final data = homeController.basketList[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 30,
                            ),
                            child: Dismissible(
                              key: ValueKey(data['text']),
                              onDismissed: (direction) {
                                homeController.removeFromBasket(data);
                              },
                              child: ListTile(
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: colors[index % colors.length],
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        homeController.basketList[index]['image'],
                                      ),
                                    ),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      homeController.basketList[index]['text'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "2 pack",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  homeController.basketList[index]['price'],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Total', style: TextStyle(fontSize: 16)),
                            Text(
                              "\$ ${homeController.totalPrice}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ).paddingOnly(left: 25),
        
                        Expanded(flex: 2, child: CustomButton(text: "Checkout")),
                      ],
                    ).paddingOnly(bottom: 10),
                  ],
                ),
        ),
      ),
    );
  }
}
