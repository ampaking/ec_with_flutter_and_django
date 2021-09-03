import 'package:fcommerce/const/const.dart';
import 'package:fcommerce/screen/home_screen.dart';
import 'package:fcommerce/state/product_data_stracture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductDataStacture(),
        )
      ],
      child: MaterialApp(
        title: 'Ecommerce',
        theme: ThemeData(
          primaryColor: kMianColor,
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.pageRpute: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}
