import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc_architecture/UI/shopping_cart.dart';
import 'package:grocery_app_bloc_architecture/model/shop.dart';
import 'package:grocery_app_bloc_architecture/shop/bloc/shop_bloc.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key key, this.shopItem}) : super(key: key);

  final ShopItem shopItem;
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<ShopItem> cartItems = [];

  bool _itemselected = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ShopBloc, ShopState>(
      listener: (context, state) {},
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          if (state is ItemAddingCartState) {
            cartItems = state.cartItems;
          }

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
                "Product Details",
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
                          cartItems.length == 0
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
                                            cartItems.length.toString(),
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 400,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              elevation: 0.0,
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // photo and title
                                      SizedBox(
                                        height: 250.0,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            Container(
                                              child: Image.network(
                                                  widget.shopItem.imageUrl),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            // Image.network(widget.shopItem.imageUrl),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  widget.shopItem.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0),
                                ),
                                Spacer(),
                                Text('\₹${widget.shopItem.price}',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hello",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(),
                                Spacer(),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60),
                                  child: Text(
                                    'Quantity',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 19.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 80,
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 0.5)),
                                      child: Text(
                                        widget.shopItem.category,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle_rounded),
                                  onPressed: () {
                                    if (widget.shopItem.quantity > 1)
                                      setState(() {
                                        widget.shopItem.quantity--;
                                      });
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 30,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 0.5)),
                                    child: Text(
                                      widget.shopItem.quantity.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_circle_rounded),
                                  onPressed: () {
                                    setState(() {
                                      widget.shopItem.quantity++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                            color: Colors.pink,
                            onPressed: () {
                              if (_itemselected == false) {
                                ShopItem cartItem = ShopItem(
                                  imageUrl: widget.shopItem.imageUrl,
                                  title: widget.shopItem.title,
                                  price: widget.shopItem.price,
                                  quantity: widget.shopItem.quantity,
                                );

                                cartItems.add(cartItem);

                                BlocProvider.of<ShopBloc>(context)
                                  ..add(
                                      ItemAddedCartEvent(cartItems: cartItems));

                                setState(() {
                                  _itemselected = true;
                                });
                              } else
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BlocProvider.value(
                                      value: BlocProvider.of<ShopBloc>(context),
                                      child: ShoppingCart(),
                                    ),
                                  ),
                                );
                            },
                            child: Text(
                              _itemselected ? 'Go to Cart' : 'Add to Cart',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    Container(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
                        child: Text(
                            "Grocery stores also offer non-perishable foods that are packaged in bottles, boxes, and cans; some also have bakeries, butchers, delis, and fresh produce. Large grocery stores that stock significant amounts of non-food products, such as clothing and household items, are called supermarkets. Some large supermarkets also include a pharmacy, and customer service, redemption, and electronics sections.",
                            maxLines: 10,
                            style: TextStyle(
                                fontSize: 13.0, color: Colors.black38))),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
