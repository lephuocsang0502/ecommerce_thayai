import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name, description;
  final List<String> productPictures;
  final double rating, price;
  final bool isFavourite, offer;

  Product({
    @required this.id,
    this.productPictures,
    this.rating = 0.0,
    this.isFavourite = false,
    this.offer = false,
    this.name,
    this.price,
    this.description,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      description: json['description'],
      id: json['id'],
      price: json['price'].toDouble(),
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        //'rating': rating,
        'name': name,
        'description': description,
        //'material': material,
        'productPictures': productPictures,
        //'colors': colors,
      };
}

// Our demo Products
