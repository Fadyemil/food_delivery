// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/features/home/data/models/popular_product_Model.dart';
import 'package:food_delivery_app/features/home/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/features/home/logic/controllers/cart_controllers.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartControllers _cart;

  int quantity = 0;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      log("found popular product list");
      _popularProductList = [];
      _popularProductList
          .addAll(PopularProductModel.fromJson(response.body).products);
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      quantity = cheakQuantity(quantity + 1);
      log("quantity increased to $quantity");
    } else {
      quantity = cheakQuantity(quantity - 1);
      log("quantity decreased to $quantity");
    }
    update();
  }

  int cheakQuantity(int quantity) {
    if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        'item count',
        'You can\'t add more !',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        'item count',
        'You can\'t reduce more !',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else {
      return quantity;
    }
  }

  
  void initProduct({required CartControllers cart, Products? product}) {
    quantity = 0;
    _inCartItems = 0;
    _cart = cart;

    bool exists = cart.existInCart(product!);
    log("Item exists in cart: ${exists.toString()}");

    if (exists) {
      _inCartItems = _cart.getQuantity(product);
    }
    log("Quantity in the cart for this product is $_inCartItems");
    update();
  }

  void addItem(Products product) {
    // if (quantity > 0) {
      _cart.addItem(product, quantity);
      quantity = 0;

      _inCartItems = _cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        log("addItem id this is : ${value.id} this quantity is : ${value.quantity}");
      });
      update();
    /*} else {
      Get.snackbar(
        'item count',
        'You Should at least add an item in the cart !',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }*/
  }

  int get totalItems{
    return _cart.totoalItems;
  }
}
