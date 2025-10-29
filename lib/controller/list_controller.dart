import 'package:foodshop/model/product_model.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  var favorite = <Product>[].obs;

  void toggleFavorite(Product product) {
    if (favorite.any((p) => p.id == product.id)) {
      favorite.removeWhere((p) => p.id == product.id);
    } else {
      favorite.add(product);
    }
  }

  bool isFavorite(Product product) {
    return favorite.any((p) => p.id == product.id);
  }
}
