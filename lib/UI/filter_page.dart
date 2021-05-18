import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc_architecture/UI/product_page.dart';
import 'package:grocery_app_bloc_architecture/UI/shopping_cart.dart';
import 'package:grocery_app_bloc_architecture/model/shop.dart';
import 'package:grocery_app_bloc_architecture/shop/bloc/shop_bloc.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key key}) : super(key: key);
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<ShopItem> cartItems = [];
  List<ShopItem> shopItems = [];
  List<ShopItem> filteredshopItems = [];
  // To access the State of Filterchip widget
  ProductPageState productPageState = ProductPageState();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return BlocListener<ShopBloc, ShopState>(
      listener: (context, state) {},
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          // Basically the state is ShopPageLoaded state as filter will be applied when the Page is loaded as Users want to see the speciifc product
          if (state is ShopPageLoadedState) {
            cartItems = state.cartData.shopitems;
            shopItems = state.shopData.shopitems;
            filteredshopItems = shopItems;
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
                  "List Preferences",
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
              body: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: themeData.disabledColor))),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: <Widget>[
                        //     IconButton(
                        //         icon: const Icon(Icons.close),
                        //         onPressed: () {
                        //           Navigator.pop(context);
                        //         }),
                        //     Text(
                        //       'FILTER/SORTING',
                        //       style: TextStyle(
                        //           fontSize: 12.0, color: Colors.black26),
                        //     ),
                        //     _verticalD(),
                        //     // ignore: deprecated_member_use
                        //     OutlineButton(
                        //         borderSide:
                        //             BorderSide(color: Colors.amber.shade500),
                        //         child: const Text('CLEAR'),
                        //         textColor: Colors.amber.shade500,
                        //         onPressed: () {
                        //           //   setState(() {
                        //           //     key.currentState
                        //           //         .deselect(key.currentState.isSelected);
                        //           //   });
                        //         },
                        //         shape: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(30.0),
                        //         )),
                        //     _verticalD(),
                        //     // ignore: deprecated_member_use
                        //     OutlineButton(
                        //         borderSide:
                        //             BorderSide(color: Colors.amber.shade500),
                        //         child: const Text('APPLY'),
                        //         textColor: Colors.amber.shade500,
                        //         onPressed: () {
                        //           // Apply the following Filters
                        //           Navigator.pop(context);
                        //         },
                        //         shape: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(30.0),
                        //         )),
                        //   ],
                        // ),
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        )),
                        Container(
                            height: 500.0,
                            margin: EdgeInsets.only(left: 7.0, top: 5.0),
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _titleContainer("Sort"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            child: Wrap(
                                          spacing: 5.0,
                                          runSpacing: 3.0,
                                          children: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  shopItems.sort((a, b) => a
                                                      .price
                                                      .compareTo(b.price));
                                                  filteredshopItems = shopItems;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text('Lowest Price First'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  shopItems.sort((b, a) => a
                                                      .price
                                                      .compareTo(b.price));
                                                  filteredshopItems = shopItems;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child:
                                                  Text('Highest Price First'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  shopItems.sort();
                                                  filteredshopItems = shopItems;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text('Alphabetical Order'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  filteredshopItems = shopItems
                                                      .where((u) =>
                                                          (u.price) < 90.0)
                                                      .toList();
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text('Less than \₹90'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  filteredshopItems = shopItems
                                                      .where((u) =>
                                                          (u.price) >= 90.0)
                                                      .toList();
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                  'Greater than and equal to \₹90'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  filteredshopItems = shopItems
                                                      .where((u) =>
                                                          (u.price) < 50.0)
                                                      .toList();
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text('Less than \₹50'),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.blueGrey,
                                      height: 10.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _titleContainer('Filter'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          child: Wrap(
                                            spacing: 5.0,
                                            runSpacing: 5.0,
                                            children: <Widget>[
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    filteredshopItems =
                                                        shopItems
                                                            .where((u) => (u
                                                                .category
                                                                .contains(
                                                                    "fruits")))
                                                            .toList();
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Fruits'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    filteredshopItems = shopItems
                                                        .where((u) => (u
                                                            .category
                                                            .contains(
                                                                "vegetables")))
                                                        .toList();
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Vegetables'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // May be in future
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Dairy Products'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // May be in future
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Special Price'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // May be in future
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Buy 1 GET 1 Free'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // May be in future
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Fresh'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.blueGrey,
                                      height: 10.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _titleContainer('Discount'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          child: Wrap(
                                            spacing: 5.0,
                                            runSpacing: 5.0,
                                            children: <Widget>[
                                              ElevatedButton(
                                                onPressed: () {
                                                  // May be in future
                                                  Navigator.pop(context);
                                                },
                                                child: Text('10% OR LESS'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // May be in future
                                                  Navigator.pop(context);
                                                },
                                                child: Text('20% OR LESS'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // May be in future
                                                  Navigator.pop(context);
                                                },
                                                child: Text('30% OR LESS'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // May be in future
                                                  Navigator.pop(context);
                                                },
                                                child: Text('40% OR LESS'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // May be in future
                                                  Navigator.pop(context);
                                                },
                                                child: Text('50% OR LESS'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // May be in future
                                                  Navigator.pop(context);
                                                },
                                                child: Text('70% OR LESS'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.blueGrey,
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ]),
                ),
              ));
        },
      ),
    );
  }

  Widget _titleContainer(String myTitle) {
    return Text(
      myTitle,
      style: TextStyle(
          color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }
}
