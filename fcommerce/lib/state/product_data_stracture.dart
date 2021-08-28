import 'package:fcommerce/state/products.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductDataStacture with ChangeNotifier {
  List<Product> _products = [];
}
