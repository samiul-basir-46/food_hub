
import 'package:foodshop/routes/route_names.dart';
import 'package:foodshop/views/AddBasketView/add_busket_view.dart';
import 'package:foodshop/views/CartView/cart_view.dart';
import 'package:foodshop/views/FavoriteView/favorite_view.dart';
import 'package:get/get.dart';
import '../views/HomeView/home_view.dart';
import '../views/OnboardingView/onboarding_view.dart';
import '../views/OnboardingView/onboarding_view_2.dart';
import '../views/SplashView/splash_view.dart';

class RoutePages {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: RouteNames.splash, page: () => SplashView()),
    GetPage(name: RouteNames.onBoard, page: () => OnboardingView()),
    GetPage(name: RouteNames.onBoard2, page: () => OnboardingView2()),
    GetPage(name: RouteNames.home, page: () => HomeView()),
    GetPage(name: RouteNames.favorite, page: () => FavoriteView()),
    GetPage(name: RouteNames.cart, page: () => CartView()),
    GetPage(name: RouteNames.addBasket, page: () => AddBasketView()),
    // GetPage(name: RouteNames.home, page: () => HomeView()),
    // GetPage(name: RouteNames.home, page: () => HomeView()),
  ];
}
