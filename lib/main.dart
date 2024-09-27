import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:e_commerce/controllers/recommended_product_controller.dart';
import 'package:e_commerce/pages/loading.dart';
import 'package:e_commerce/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependecies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  Get.find<PopularProductController>().getPopularProductList();
  Get.find<RecommendedProductController>().getRecommendedProductList();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loading(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    ),
  );
}
