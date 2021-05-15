import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc_architecture/model/shop.dart';
import 'package:grocery_app_bloc_architecture/shop/bloc/shop_bloc.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<ShopItem> cartItems;
  double totalAmount = 0;
  double delievery = 50.0;
  void calculateTotalAmount(List<ShopItem> list) {
    double res = 0;

    list.forEach((element) {
      res = res + element.price * element.quantity;
    });
    totalAmount = res;
    // Adding the Delievery charges:: If the total order amount will be less then Rs.50 then Rs.50 will be the delivery charges leived on the total
    if (totalAmount < 50.0 && totalAmount > 0.0) {
      delievery = 50.0;
      totalAmount += delievery;
    } else {
      delievery = 0.00;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        if (state is ItemAddedCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }
        if (state is ShopPageLoadedState) {
          cartItems = state.cartData.shopitems;
          calculateTotalAmount(cartItems);
        }
        if (state is ItemDeletingCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }

        if (state is ItemAddingCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }
        return Scaffold(
          backgroundColor: Color(0xFFEEEEEE),
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: Text(
              'Shopping Cart',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          bottomNavigationBar: Container(
            height: 130,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    color: Color(0xFF000000).withOpacity(0.20),
                  ),
                  BoxShadow(
                    offset: Offset(0, -1),
                    blurRadius: 3,
                    color: Color(0xFF000000).withOpacity(0.20),
                  ),
                  BoxShadow(
                    offset: Offset(0, -1),
                    blurRadius: 4,
                    color: Color(0xFF000000).withOpacity(0.14),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                )),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Icon(Icons.delivery_dining),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60.0),
                        child: Container(
                          child: Text(
                            "Delivery Charges:   \₹${delievery.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Divider(
                    color: Colors.black,
                    height: 20.0,
                  ),
                  Text(
                    'Total Amount',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\₹${totalAmount.toStringAsFixed(2)}',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          body: cartItems == null || cartItems.length == 0
              ? Center(
                  child: Text(
                  'Your Cart is Empty',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ))
              : ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    cartItems[index].imageUrl,
                                    height: 64,
                                    width: 64,
                                  ),
                                  SizedBox(width: 20),
                                  Text(cartItems[index].title),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.cancel),
                                    onPressed: () {
                                      setState(() {
                                        if (state is ShopPageLoadedState) {
                                          state.cartData.shopitems
                                              .removeAt(index);
                                          calculateTotalAmount(cartItems);
                                          BlocProvider.of<ShopBloc>(context)
                                            ..add(ItemDeleteCartEvent(
                                                cartItems:
                                                    state.cartData.shopitems));
                                        } else if (state
                                            is ItemAddedCartState) {
                                          state.cartItems.removeAt(index);
                                          calculateTotalAmount(cartItems);

                                          BlocProvider.of<ShopBloc>(context)
                                            ..add(ItemDeleteCartEvent(
                                                cartItems: state.cartItems));
                                        } else if (state
                                            is ItemDeletingCartState) {
                                          state.cartItems.removeAt(index);
                                          calculateTotalAmount(cartItems);

                                          BlocProvider.of<ShopBloc>(context)
                                            ..add(ItemDeleteCartEvent(
                                                cartItems: state.cartItems));
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      if (cartItems[index].quantity > 1)
                                        setState(() {
                                          calculateTotalAmount(cartItems);
                                          cartItems[index].quantity--;
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
                                        cartItems[index].quantity.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        calculateTotalAmount(cartItems);
                                        cartItems[index].quantity++;
                                      });
                                    },
                                  ),
                                  Spacer(),
                                  Text(
                                      '\₹${cartItems[index].price * cartItems[index].quantity} ')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
