
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:foodshop/controller/home_controller.dart';
import 'package:foodshop/controller/list_controller.dart';
import 'package:foodshop/routes/route_names.dart';
import 'package:foodshop/routes/route_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/text_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(TextController(),permanent: true);
  Get.put(IconController(),permanent: true);
  Get.put(HomeController(),permanent: true);
  Get.put(ListController(),permanent: true);
  await GetStorage.init();
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder ,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'FontMain',
        scaffoldBackgroundColor: Color(0xFFffffff),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      getPages: RoutePages.routes,
      initialRoute: RouteNames.splash,
    );
  }
}

