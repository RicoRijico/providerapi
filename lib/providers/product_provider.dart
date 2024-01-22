import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider_api/constants/environment.dart';
import 'package:provider_api/models/product.dart';
class ProductProvider extends ChangeNotifier {

  List<Article> _products = [];

  List<Article> get products => _products;
  bool _loading = false;
  bool get loading => _loading;

  Future<void> fetchProduct() async {
     _loading = true;
    final response = await http.get(Uri.parse("${Environment.API_URL}posts"));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print(data[0]);
      _products = data.map((pro) => Article.fromJson(pro)).toList();
      _loading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load posts');
    }
  }


}