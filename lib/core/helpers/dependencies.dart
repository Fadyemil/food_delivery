import 'package:food_delivery_app/features/home/logic/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/core/data/api/api_client.dart';
import 'package:food_delivery_app/features/home/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/core/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //* Initialize the API client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  //*  repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //* controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
