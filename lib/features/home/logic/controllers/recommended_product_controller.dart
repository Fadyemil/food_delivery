import 'dart:developer';

import 'package:food_delivery_app/features/home/data/models/popular_product_Model.dart';
import 'package:food_delivery_app/features/home/data/repository/recommended_product_repo.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommenedProductList = [];
  List<dynamic> get recommendedProductList => _recommenedProductList;

  Future<void> getRecommenedProductList() async {
    Response response = await recommendedProductRepo.getRecommenedProductList();
    if (response.statusCode == 200) {
      log("found recommended product list");
      _recommenedProductList = [];
      _recommenedProductList
          .addAll(PopularProductModel.fromJson(response.body).products);
      update();
    } else {}
  }
}
