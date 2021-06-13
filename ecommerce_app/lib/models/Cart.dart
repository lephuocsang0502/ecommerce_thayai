import 'package:flutter/material.dart';

import 'Product.dart';

class Cart {
  Product product;
  int numOfItem;

  Cart({this.product, this.numOfItem});
  void addProductToCart(Product product) {
    cartList.add(Cart(product: product, numOfItem: 1));
  }

  dynamic getTotal() {
    cartList.forEach((cart) {
      sum = sum + cart.product.price;
    });
    return sum;
  }
}

double sum = 0.0;
List<Cart> cartList = [];
