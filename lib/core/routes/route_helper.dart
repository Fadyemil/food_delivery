import 'package:food_delivery_app/features/home/ui/screen/main_foot_page.dart';
// import 'package:food_delivery_app/features/home/ui/screen/recommended_food_detail.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String recommendedFoodDetail = "/RecommendedFoodDetail";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainFootPage()),
    // GetPage(name: recommendedFoodDetail, page: () => RecommendedFoodDetail(products: null,)),
  ];
}
