import 'package:fcommerce/const/const.dart';
import 'package:fcommerce/state/product_data_stracture.dart';
import 'package:fcommerce/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String pageRpute = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading =
          await Provider.of<ProductDataStacture>(context).getProducts();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductDataStacture>(context).productsList;
    if (!_isLoading)
      return Scaffold(
        appBar: AppBar(
          actions: [
            Icon(
              Icons.shopping_bag,
              color: Colors.green,
            )
          ],
        ),
        body: Center(
          child: Container(
            child: Text("$_isLoading value is Flase, so something is missing"),
          ),
        ),
      );
    else
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (ctx, index) => SingleProduct(
                      title: products[index].title,
                      isFavorite: products[index].favorite,
                      id: products[index].id,
                      image: products[index].productPhoto,
                    )),
          ),
        ),
      );
  }
}
