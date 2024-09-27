import 'package:e_commerce/pages/cart/cart_page.dart';
import 'package:e_commerce/pages/homepage/home_page.dart';
import 'package:e_commerce/pages/homepage/recommended_food_detail.dart';
import 'package:e_commerce/pages/loading.dart';
import 'package:e_commerce/pages/popular_food_details.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String home = '/home';
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cart = '/cart';

  static String gethome() => '$home';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';
  static String getCart() => '$cart';

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => Loading()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetails(pageId: int.parse(pageId!));
      },
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.circularReveal,
    ),
    GetPage(name: cart, page: () => CartPage()),
  ];
}
