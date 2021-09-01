import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  static const pageRoute = '/product-detials';

  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
    );
  }
}
