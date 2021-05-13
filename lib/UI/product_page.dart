import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc_architecture/model/shop.dart';
import 'package:grocery_app_bloc_architecture/shop/bloc/shop_bloc.dart';

import 'product_detail.dart';
import 'product_item.dart';
import 'shopping_cart.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key key}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool loadingData = true;
  List<ShopItem> _cartItems = [];
  List<ShopItem> shopItems = [];
  List<ShopItem> filteredshopItems = [];
  @override
  Widget build(BuildContext context) {
    return BlocListener<ShopBloc, ShopState>(
      listener: (context, state) {
        if (state is ShopInitial) {
          loadingData = true;
        } else if (state is ShopPageLoadedState) {
          shopItems = state.shopData.shopitems;
          filteredshopItems = shopItems;
          _cartItems = state.cartData.shopitems;
          loadingData = false;
        }
        if (state is ItemAddedCartState) {
          _cartItems = state.cartItems;
          loadingData = false;
        }
        if (state is ItemDeletingCartState) {
          _cartItems = state.cartItems;
          loadingData = false;
        }
      },
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          print("produc page state: $state");

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
                alignment: Alignment.centerLeft,
                tooltip: 'Back',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Grocery App",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.cyan,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 150.0,
                    width: 30.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                    value: BlocProvider.of<ShopBloc>(context),
                                    child: ShoppingCart())));
                      },
                      child: Stack(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => BlocProvider.value(
                                            value: BlocProvider.of<ShopBloc>(
                                                context),
                                            child: ShoppingCart())));
                              }),
                          _cartItems.length == 0
                              ? Container()
                              : Positioned(
                                  child: Stack(
                                  children: <Widget>[
                                    Icon(Icons.brightness_1,
                                        size: 20.0,
                                        color: Colors.orange.shade500),
                                    Positioned(
                                        top: 4.0,
                                        right: 5.5,
                                        child: Center(
                                          child: Text(
                                            _cartItems.length.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )),
                                  ],
                                )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            // appBar: AppBar(
            //   title: Text(
            //     "Grocery App",
            //     style: TextStyle(
            //       color: Colors.black,
            //     ),
            //   ),
            //   elevation: 0,
            //   backgroundColor: Colors.cyan,

            // ),
            backgroundColor: Color(0xFFEEEEEE),
            // floatingActionButton: FloatingActionButton(
            //   backgroundColor: Colors.cyan,
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (_) => BlocProvider.value(
            //                 value: BlocProvider.of<ShopBloc>(context),
            //                 child: ShoppingCart())));
            //   },
            //   child: Text(
            //     _cartItems.length.toString(),
            //     style: TextStyle(
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            body: loadingData
                ? Center(
                    child: Center(
                    child: CircularProgressIndicator(),
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                          child: TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.all(10.0),
                              hintText: "Search",
                            ),
                            onChanged: (string) {
                              setState(() {
                                filteredshopItems = shopItems
                                    .where((u) => (u.title
                                            .toLowerCase()
                                            .contains(string.toLowerCase()) ||
                                        u.category
                                            .toLowerCase()
                                            .contains(string.toLowerCase())))
                                    .toList();
                              });
                            },
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.6,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                      ),
                                      itemCount: filteredshopItems.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return ProductItem(
                                          addToCart: () {
                                            setState(() {
                                              _cartItems.add(
                                                  filteredshopItems[index]);
                                            });

                                            print("added");
                                          },
                                          // productImage:
                                          //     shopItems[index].imageUrl,
                                          productImage: filteredshopItems[index]
                                              .thumbnail,
                                          price: filteredshopItems[index].price,
                                          title: filteredshopItems[index].title,
                                          press: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        BlocProvider.value(
                                                            value: BlocProvider
                                                                .of<ShopBloc>(
                                                                    context)
                                                              ..add(ItemAddingCartEvent(
                                                                  cartItems:
                                                                      _cartItems)),
                                                            child:
                                                                ProductDetail(
                                                              shopItem:
                                                                  filteredshopItems[
                                                                      index],
                                                            ))));
                                          },
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
// \₹ --> Rupees Symbol
