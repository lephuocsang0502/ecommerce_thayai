import 'package:flutter/cupertino.dart';

import '../constants.dart';

class Category {
  final int id;
  final String name;
  final String categoryImage;

  Category({@required this.id, @required this.name, @required this.categoryImage});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      categoryImage: "$baseServerUrl${json['icon']['url']}",
      name: json['name'],
    );
  }
}

List<Map<String, dynamic>> categories = [
  {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
  {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
  {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
  {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
  {"icon": "assets/icons/Discover.svg", "text": "More"},
];
