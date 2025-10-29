import 'package:flutter/material.dart';
import 'package:foodshop/model/product_model.dart';
import 'package:foodshop/utils/colors.dart';
import 'package:get/get.dart';
import '../../controller/list_controller.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({super.key});

  final ListController listController = Get.find<ListController>();

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
        title: Text("My favorite"),
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
      body: Obx(
        () => listController.favorite.isEmpty
            ? Center(child: Text("No favorite items yet"))
            : ListView.builder(
                itemCount: listController.favorite.length,
                itemBuilder: (context, index) {
                  Product product = listController.favorite[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                    child: ListTile(
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: colors[index % colors.length],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(product.image),
                          ),
                        ),
                      ),
                      title: Text(
                        product.name,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      trailing: Icon(
                        Icons.favorite,
                        color: AppColors.primaryColor,
                        size: 30,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
