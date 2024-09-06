// route_helper.dart

import 'package:food_delivery_app/features/home/ui/screen/main_foot_page.dart';
import 'package:food_delivery_app/features/home/ui/screen/populer_food_details.dart';
import 'package:get/get.dart';
// import 'package:food_delivery_app/features/home/data/models/popular_product_Model.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFoodDetail = "/popularFoodDetail";

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const MainFootPage(),
    ),
    GetPage(
      name: RouteHelper.popularFoodDetail,
      page: () => PopulerFoodDetails(products: Get.arguments['products']),
      // binding: CartBinding(),
    ),
  ];
}
