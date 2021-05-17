import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            Text(
                              'FILTER/SORTING',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black26),
                            ),
                            _verticalD(),
                            // ignore: deprecated_member_use
                            OutlineButton(
                                borderSide:
                                    BorderSide(color: Colors.amber.shade500),
                                child: const Text('CLEAR'),
                                textColor: Colors.amber.shade500,
                                onPressed: () {
                                  // Clear the selected Filter chip
                                },
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                            _verticalD(),
                            // ignore: deprecated_member_use
                            OutlineButton(
                                borderSide:
                                    BorderSide(color: Colors.amber.shade500),
                                child: const Text('APPLY'),
                                textColor: Colors.amber.shade500,
                                onPressed: () {
                                  // Apply the following Filters
                                  Navigator.pop(context);
                                },
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
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
                                            filterChipWidget(
                                                chipName: 'Lowest Price First'),
                                            filterChipWidget(
                                                chipName:
                                                    'Highest Price First'),
                                            filterChipWidget(
                                                chipName: 'Alphabetical Order'),
                                            filterChipWidget(
                                                chipName:
                                                    'Popular Price First'),
                                            filterChipWidget(
                                                chipName: 'Best Price First'),
                                            filterChipWidget(
                                                chipName: 'Most Rated First'),
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
                                              filterChipWidget(
                                                  chipName: 'Fruits'),
                                              filterChipWidget(
                                                  chipName: 'Vegetables'),
                                              filterChipWidget(
                                                  chipName: 'Special Price'),
                                              filterChipWidget(
                                                  chipName: 'Dairy Products'),
                                              filterChipWidget(
                                                  chipName: 'Buy 1 GET 1 Free'),
                                              filterChipWidget(
                                                  chipName: 'Fresh'),
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
                                              filterChipWidget(
                                                  chipName: '10% OR LESS'),
                                              filterChipWidget(
                                                  chipName: '20% OR LESS'),
                                              filterChipWidget(
                                                  chipName: '30% OR LESS'),
                                              filterChipWidget(
                                                  chipName: '40% OR LESS'),
                                              filterChipWidget(
                                                  chipName: '50% OR LESS'),
                                              filterChipWidget(
                                                  chipName: '70% OR LESS'),
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

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 5.0, right: 0.0, top: 5.0, bottom: 0.0),
      );
  Widget _titleContainer(String myTitle) {
    return Text(
      myTitle,
      style: TextStyle(
          color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }
}

// ignore: camel_case_types
class filterChipWidget extends StatefulWidget {
  final String chipName;
  // Function filter() {}

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

// ignore: camel_case_types
class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(
          color: Color(0xff6200ee),
          fontSize: 16.0,
          fontWeight: FontWeight.bold),
      selected: _isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Color(0xffededed),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Colors.cyan,
    );
  }
}
