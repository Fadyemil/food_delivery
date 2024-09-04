import 'package:food_delivery_app/core/data/api/api_client.dart';
import 'package:food_delivery_app/core/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommenedProductList() async {
    return await apiClient.get(AppConstants.recommendedProductUri);
  }
}
