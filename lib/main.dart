import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc_architecture/UI/product_page.dart';
import 'package:grocery_app_bloc_architecture/shop/bloc/shop_bloc.dart';

void main() {
  runApp(GroceryApp());
}

class GroceryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(),
      home: BlocProvider(
        create: (context) => ShopBloc(),
        child: ProductPage(),
      ),
    );
  }
}
