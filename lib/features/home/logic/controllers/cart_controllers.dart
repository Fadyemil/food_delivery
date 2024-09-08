// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_types_as_parameter_names, non_constant_identifier_names, unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/features/home/data/models/cart_model.dart';
import 'package:food_delivery_app/features/home/data/models/popular_product_Model.dart';
import 'package:food_delivery_app/features/home/data/repository/cart_repo.dart';
import 'package:get/get.dart';

class CartControllers extends GetxController {
  final CartRepo cartRepo;

  CartControllers({required this.cartRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(Products product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (Value) {
        Get.snackbar(
          'Done adding product',
          ' quantity is already in the cart ${Value.quantity! + quantity}',
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );

        totalQuantity = Value.quantity! + quantity;
        return CartModel(
          id: Value.id,
          name: Value.name,
          price: Value.price,
          img: Value.img,
          quantity: Value.quantity! + quantity,
          isExit: true,
          time: DateTime.now().toString(),
        );
      });

      if (quantity <= 0) {
        _items.remove(product.id!);
        Get.snackbar(
          'Done removing product',
          'Item removed from cart',
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    } else {
      if (quantity > 0) {
        log("Length of items: " + _items.length.toString());
        _items.putIfAbsent(
          product.id!,
          () {
            log(
              'Adding item to the cart id : ' +
                  product.id!.toString() +
                  " , quantity: " +
                  quantity.toString(),
            );
            Get.snackbar(
              'Done adding product',
              ' quantity is already in the cart ${quantity}',
              backgroundColor: AppColors.mainColor,
              colorText: Colors.white,
            );
            return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExit: true,
              time: DateTime.now().toString(),
            );
          },
        );
        log("Length of items: " + _items.length.toString());
      } else {
        Get.snackbar(
          'Error',
          'Quantity should be greater than 0',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  // Check if a product exists in the cart
  bool existInCart(Products product) {
    return _items.containsKey(product.id);
  }

  // Get the quantity of a specific product
  int getQuantity(Products product) {
    if (_items.containsKey(product.id)) {
      return _items[product.id]!.quantity!;
    }
    return 0; // Return 0 if the product doesn't exist in the cart
  }

  int get totoalItems {
    var totoalQuantity = 0;
    _items.forEach((key, value) {
      totoalQuantity += value.quantity!;
    });
    return totoalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }
}
