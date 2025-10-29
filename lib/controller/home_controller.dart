import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

class HomeController extends GetxController {
  var menu = <Map<String, dynamic>>[
    {
      'text': 'Honey Lime Combo',
      'price': '\$ 2,000',
      'image': 'assets/images/honey_lime_fruit.png',
      'isFav': false,
      'isAdded': false,
    },
    {
      'text': 'Berry Mango Combo',
      'price': '\$ 3,000',
      'image': 'assets/images/berry_mango_fruit.png',
      'isFav': false,
      'isAdded': false,
    },
    {
      'text': 'Quinoa Fruit Salad',
      'price': '\$ 10,000',
      'image': 'assets/images/quinoa_fruit.png',
      'isFav': false,
      'isAdded': false,
    },
  ].obs;

  var favoriteList = <Map<String, dynamic>>[].obs;
  var basketList = <Map<String, dynamic>>[].obs;

  void toggleFavorite(int index) {
    menu[index]['isFav'] = !(menu[index]['isFav'] as bool);

    if (menu[index]['isFav'] as bool) {
      favoriteList.add(menu[index]);
    } else {
      favoriteList.removeWhere((item) => item['text'] == menu[index]['text']);
    }
  }

  void addToBasket(Product product) {
    Map<String, dynamic> productMap = {
      'text': product.name,
      'price': product.price,
      'image': product.image,
    };
    bool isAlreadyAdded = basketList.any(
      (item) => item['text'] == product.name,
    );

    if (!isAlreadyAdded) {
      basketList.add(productMap);
      Get.snackbar(
        "Success",
        "${product.name} added successfully",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.black,
      );
    } else {
      Get.snackbar(
        "Failed",
        "${product.name} already added",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.black,
      );
    }
  }

  void removeFromBasket(Map<String, dynamic> itemToRemove) {
    basketList.removeWhere((item) => item['text'] == itemToRemove['text']);
    Get.snackbar(
      "Removed",
      "Item removed successful",
      snackPosition: SnackPosition.TOP,
      colorText: Colors.black,
    );
  }

  double get totalPrice {
    double total = 0.0;

    for (var item in basketList) {
      String priceString = item['price'] ?? '\$0';

      String cleanPrice = priceString
          .replaceAll('\$', '')
          .replaceAll(',', '')
          .trim();

      try {
        double price = double.parse(cleanPrice);
        total += price;
      } catch (e) {
        print("Error parsing price: $priceString. Error: $e");
      }
    }
    return total;
  }

  bool addToBasketWithQuantity(Product product, int quantity) {
    bool isAlreadyAdded = basketList.any((item) => item['id'] == product.id);

    if (!isAlreadyAdded) {
      Map<String, dynamic> productMap = {
        'id': product.id,
        'text': product.name,
        'price': product.price,
        'image': product.image,
        'quantity': quantity,
      };

      basketList.add(productMap);
      return true;
    } else {
      return false;
    }
  }
}
