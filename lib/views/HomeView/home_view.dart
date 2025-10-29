import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:foodshop/controller/home_controller.dart';
import 'package:foodshop/views/HomeView/widget/custom_card.dart';
import 'package:get/get.dart';

import '../../controller/list_controller.dart';
import '../../controller/text_controller.dart';
import '../../model/product_model.dart';
import '../../routes/route_names.dart';
import '../../utils/colors.dart';
import '../../widget/custom_text_field.dart';

class HomeView extends StatelessWidget {
  final ListController listController = Get.find<ListController>();
  final HomeController homeController = Get.find<HomeController>();
  final TextController controller = Get.find<TextController>();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> recommendItem = [
      Product(
        id: 1,
        name: "Honey Lime Combo",
        price: "\$ 2,000",
        image: "assets/images/honey_lime_fruit.png",
      ),
      Product(
        id: 2,
        name: 'Berry Mango Combo',
        price: '\$ 3,000',
        image: 'assets/images/berry_mango_fruit.png',
      ),
      Product(
        id: 3,
        name: 'Quinoa Fruit Salad',
        price: '\$ 10,000',
        image: 'assets/images/quinoa_fruit.png',
      ),
      Product(
        id: 4,
        name: 'Melon Fruit Salad',
        price: '\$ 6,000',
        image: 'assets/images/melon_fruit.png',
      ),
    ];

    List<Product> hottestItem = [
      Product(
        id: 5,
        name: 'Tropical Fruit Salad',
        price: '\$ 8,000',
        image: 'assets/images/tropical_fruit.png',
      ),
      Product(id: 6, name: 'Chickpea Salad', price: "\$ 6,000", image: ""),
      Product(id: 7, name: 'Three Bean Salad', price: "\$ 4,000", image: ""),
    ];

    List<Color> colors = [
      const Color(0xFFFFFAEB),
      const Color(0xFFFEF0F0),
      const Color(0xFFF1EFF6),
    ];

    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Obx(
          () => SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/menu_icon.png',
                              height: 30,
                              width: 30,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          Get.toNamed(RouteNames.favorite),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.orange,
                                        size: 30,
                                      ),
                                    ),
                                    const Text("Fav"),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () => Get.toNamed(RouteNames.cart),
                                      child: const Icon(
                                        Icons.shopping_basket,
                                        color: Colors.orange,
                                        size: 30,
                                      ),
                                    ),
                                    const Text("Basket"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Row(
                          children: [
                            Flexible(
                              flex: 3,
                              child: AutoSizeText(
                                "Hello ${controller.userName.value}, what fruit salad combo do you want today?",
                                maxLines: 2,
                                minFontSize: 20,
                                style: const TextStyle(
                                  color: Color(0xFF27214D),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Flexible(flex: 1, child: SizedBox()),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 4,
                              child: CustomTextField(
                                hint: const Text(
                                  "Search for fruit salad combos",
                                ),
                                prefixIcon: Icons.search,
                                isTrue: true,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Image.asset(
                                'assets/images/filter_icon.png',
                                height: 43,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        const AutoSizeText(
                          "Recommended Combo",
                          minFontSize: 24,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: recommendItem.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var data = recommendItem[index];
                        return CustomCard(
                          product: data,
                          image: data.image,
                          text: data.name,
                          price: data.price,
                          onTapBasket: () {
                            Get.toNamed(RouteNames.addBasket, arguments: data);
                          },
                          onTapFav: () {
                            listController.toggleFavorite(data);
                          },
                          onTapAdd: () => homeController.addToBasket(data),
                        );
                      },
                    ),
                  ),
                  TabBar(
                    dividerColor: Colors.transparent,
                    unselectedLabelStyle: const TextStyle(
                      color: Color(0xFF938DB5),
                      fontSize: 14,
                    ),
                    labelStyle: const TextStyle(
                      overflow: TextOverflow.visible,
                      color: Color(0xFF27214D),
                      fontSize: 20,
                    ),
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 3,
                        color: AppColors.primaryColor,
                      ),
                      insets: EdgeInsets.only(right: 40),
                    ),
                    tabs: const [
                      Tab(text: "Hottest"),
                      Tab(text: "Popular"),
                      Tab(text: "New Combo"),
                      Tab(text: "Top"),
                    ],
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    height: screenHeight * 0.25,
                    width: double.infinity,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: hottestItem.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var data = hottestItem[index];
                            return CustomCard(
                              product: data,
                              image: data.image,
                              text: data.name,
                              price: data.price,
                              color: colors[index % colors.length],
                              isColor: true,
                              onTapBasket: () {
                                Get.toNamed(
                                  RouteNames.addBasket,
                                  arguments: data,
                                );
                              },
                              onTapFav: () =>
                                  listController.toggleFavorite(data),
                              onTapAdd: () {
                                homeController.addToBasket(data);
                              },
                            );
                          },
                        ),
                        const Center(child: Text("Coming Soon")),
                        const Center(child: Text("Coming Soon")),
                        const Center(child: Text("Coming Soon")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
