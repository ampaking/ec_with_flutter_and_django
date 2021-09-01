import 'dart:convert';

import 'package:fcommerce/state/product.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductDataStacture with ChangeNotifier {
  List<Product> _products = [];

  Future<bool> getProducts() async {
    String url = 'http://192.168.11.7:8000/api/products/';

    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'token 2e1b3a80497945f50c24dd7a4b997b957a820245'
      });
      var data = json.decode(response.body);
      print(data);
      List<Product> demo = [];
      data.forEach((element) {
        Product product = Product.fromJson(element);
        demo.add(product);
        print(product);
      });
      _products = demo;
      return true;
    } catch (e) {
      print("e getProducts");
      print(e);
      return false;
    }
  }

  List<Product> get productsList {
    return [..._products];
  }
}
