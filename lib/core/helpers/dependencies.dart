// dependencies.dart
import 'package:get/get.dart';
import 'package:food_delivery_app/features/home/data/repository/cart_repo.dart';
import 'package:food_delivery_app/features/home/logic/controllers/cart_controllers.dart';
import 'package:food_delivery_app/features/home/logic/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/features/home/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/features/home/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/core/data/api/api_client.dart';
import 'package:food_delivery_app/core/utils/app_constants.dart';
import 'package:food_delivery_app/features/home/logic/controllers/recommended_product_controller.dart';

Future<void> init() async {
  // Initialize the API client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  // Initialize repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.put(CartRepo(), permanent: true);
  Get.put(CartControllers(cartRepo: Get.find()), permanent: true);

  // Initialize controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));

  // Check if CartControllers is registered before initializing
  if (!Get.isRegistered<CartControllers>()) {
    Get.lazyPut(() => CartControllers(cartRepo: Get.find()));
  }
}
