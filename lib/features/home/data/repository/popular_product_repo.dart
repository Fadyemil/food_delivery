import 'package:food_delivery_app/core/data/api/api_client.dart';
import 'package:food_delivery_app/core/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList()async{
    return await apiClient.get(AppConstants.popularProductUri);
  }
}
