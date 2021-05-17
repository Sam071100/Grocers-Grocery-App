import 'package:flutter/material.dart';
import 'package:grocery_app_bloc_architecture/model/shop.dart';

// ignore: camel_case_types
class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  filterChipWidgetState createState() => filterChipWidgetState();
}

// ignore: camel_case_types
class filterChipWidgetState extends State<filterChipWidget> {
  // Functions to set the filteredshopItems according to the filter applied

  // Sort Low to High
  void byLowPrice(List<ShopItem> filteredshopItems, List<ShopItem> shopItems) {
    setState(() {
      shopItems.sort((a, b) => a.price.compareTo(b.price));
      filteredshopItems = shopItems;
    });
  }

  // Sort high to low
  void byHighPrice(List<ShopItem> filteredshopItems, List<ShopItem> shopItems) {
    setState(() {
      shopItems.sort((b, a) => a.price.compareTo(b.price));
      filteredshopItems = shopItems;
    });
  }

  // Sorting according to the Alphabetical Order
  void byAlphabeticalOrder(
      List<ShopItem> filteredshopItems, List<ShopItem> shopItems) {
    setState(() {
      shopItems.sort();
      filteredshopItems = shopItems;
    });
  }

  // Filter according to Fruits
  void byFruits(List<ShopItem> filteredshopItems, List<ShopItem> shopItems) {
    setState(() {
      filteredshopItems =
          shopItems.where((u) => (u.category.contains("fruits"))).toList();
    });
    // filteredshopItems = shopItems.where((i) => i.fruits).toList();
  }

  // Filter according to the Vegetables
  void byVegetables(
      List<ShopItem> filteredshopItems, List<ShopItem> shopItems) {
    setState(() {
      filteredshopItems =
          shopItems.where((u) => (u.category.contains("vegetables"))).toList();
    });
  }

  // Filter products Greater then Rs.90
  void byLessthen90(
      List<ShopItem> filteredshopItems, List<ShopItem> shopItems) {
    setState(() {
      filteredshopItems = shopItems.where((u) => (u.price) < 90.0).toList();
    });
  }

  // Filter products less then Rs.90
  void byLessthen200(
      List<ShopItem> filteredshopItems, List<ShopItem> shopItems) {
    setState(() {
      filteredshopItems = shopItems.where((u) => (u.price) >= 90.0).toList();
    });
  }

  // Filters products greater then Rs.50
  void byLessthen50(
      List<ShopItem> filteredshopItems, List<ShopItem> shopItems) {
    setState(() {
      filteredshopItems = shopItems.where((u) => (u.price) < 50.0).toList();
    });
  }

  var _isSelected = false;

  // This function was to deselect the selected filterchip widget on the press of Clear button
  void deselect(var isSelected) {
    setState(() {
      isSelected = false;
    });
  }

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
