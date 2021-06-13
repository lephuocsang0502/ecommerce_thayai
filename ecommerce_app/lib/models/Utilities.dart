import 'dart:convert';
import 'package:ecommerce_app/models/Product.dart';
import 'package:http/http.dart' as http;

class Utilities {
  var url = Uri.parse('http://192.168.0.100:3000/api/food');

  static List<Product> data = [];

  // Future<List<Product>> getProducts() async {
  //   var res = await http.get(url);
  //   if (res.statusCode == 200) {
  //     var content = res.body;
  //     print(content.toString());
  //     var arr = json.decode(content)['food'] as List;

  //     // for every element of arr map to _fromJson
  //     // and convert the array to list

  //     return arr.map((e) => _fromJson(e)).toList();
  //   }
  //   // ignore: deprecated_member_use
  //   return List<Product>();
  // }

  // Product _fromJson(Map<String, dynamic> item) {
  //   return new Product(
  //       description: item['description'],
  //       title: item['title'],
  //       images: item['image'],
  //       price: double.parse(item['price']),
  //       id: item['id'],
  //       colors: item['colors']);
  // }

  static String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  // ignore: missing_return
  static String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 8) {
      return 'Password should be more than 8 characters ';
    }
  }

  // ignore: missing_return

}
