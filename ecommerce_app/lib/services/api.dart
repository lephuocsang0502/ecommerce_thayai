import 'dart:convert';

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Category>> getCategories() async {
    final response = await http.get("$baseServerUrl/category/getcategory");
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Category>((json) => Category.fromJson(json)).toList();
  }

  Future<List<Product>> getProducts({categoryId}) async {
    final response = await http.get(
      categoryId != null
          ? "$baseServerUrl/categories/$categoryId"
          : "$baseServerUrl/products",
    );
    final parsed = categoryId != null
        ? jsonDecode(response.body)['products'].cast<Map<String, dynamic>>()
        : jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  Future<Product> getSingleProduct({productId}) async {
    final response = await http.get("$baseServerUrl/products/$productId");
    return Product.fromJson(jsonDecode(response.body));
  }
}
