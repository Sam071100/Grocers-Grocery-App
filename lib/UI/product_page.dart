import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app_bloc_architecture/UI/filter_page.dart';
import 'package:grocery_app_bloc_architecture/model/shop.dart';
import 'package:grocery_app_bloc_architecture/shop/bloc/shop_bloc.dart';

import 'product_detail.dart';
import 'product_item.dart';
import 'shopping_cart.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key key}) : super(key: key);
  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
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
              // leading: IconButton(
              //   icon: Icon(
              //     Icons.arrow_back_rounded,
              //     color: Colors.black,
              //   ),
              //   alignment: Alignment.centerLeft,
              //   tooltip: 'Back',
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
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
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  Card(
                    child: UserAccountsDrawerHeader(
                      accountName: Text(
                        'Shubham Samrat',
                        style: TextStyle(color: Colors.black),
                      ),
                      accountEmail: Text(
                        'shubham.samrat@iitbhu.ac.in',
                        style: TextStyle(color: Colors.black),
                      ),
                      onDetailsPressed: () {},
                      decoration: BoxDecoration(
                        backgroundBlendMode: BlendMode.difference,
                        color: Colors.white30,
                        image: DecorationImage(
                          image: ExactAssetImage('images/gro.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: ExactAssetImage('images/sam.jpg'),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.favorite_outlined,
                            color: Colors.red,
                          ),
                          title: Text("Favourites"),
                          onTap: () {},
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.history_rounded),
                          title: Text("Order History"),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Settings'),
                          onTap: () {},
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.help),
                          title: Text('Help'),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    child: ListTile(
                      leading: Icon(Icons.power_settings_new),
                      title: Text(
                        'Logout',
                        style:
                            TextStyle(color: Colors.redAccent, fontSize: 17.0),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'About',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Should you encounter any bugs, glitches, lack of functionality, delayed deliveries, billing errors or other problems on the beta website, please email us on sam@iitbhu.ac.in\n',
                          style: TextStyle(fontSize: 13.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('images/ios.jpg'),
                            Image.asset('images/play.jpg'),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
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
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.cyan,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => BlocProvider.value(
                  //             value: BlocProvider.of<ShopBloc>(context),
                  //             child: FilterPage())));
                },
                child: Icon(
                  Icons.tune_rounded,
                  color: Colors.black,
                )),
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
                                                // Navigator.pop(context);
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
                                                // Navigator.pop(context);
                                              },
                                              child:
                                                  Text('Highest Price First'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  shopItems.sort((a, b) => a
                                                      .title
                                                      .compareTo(b.title));
                                                  filteredshopItems = shopItems;
                                                });
                                                // Navigator.pop(context);
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
                                                // Navigator.pop(context);
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
                                                // Navigator.pop(context);
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
                                                // Navigator.pop(context);
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
                                                  // Navigator.pop(context);
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
                                                  // Navigator.pop(context);
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
                      ],
                    ),
                  ),
          );
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

// \₹ --> Rupees Symbol
