import 'dart:ui';

import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key key,
    this.productImage,
    this.title,
    this.price,
    this.press,
    this.addToCart,
  }) : super(key: key);
  final String productImage, title;
  final double price;
  final Function press;
  final Function addToCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 240,
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 30),
                      blurRadius: 60,
                      color: Color(0xFF393939).withOpacity(.1))
                ],
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: press,
                      child: Container(),
                    ),
                  ],
                ),
              ),
              // ),
            ),
            Positioned(
              top: 30,
              right: 39,
              child: Image.network(
                productImage,
                height: 105,
              ),
            ),
            // Temporarily removing the Add to cart button form here
            Positioned(
              bottom: 30,
              right: 50,
              // ignore: deprecated_member_use
              child: FlatButton(
                  color: Colors.pink,
                  onPressed: addToCart,
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            // Positioned(
            //   top: 30,
            //   right: 50,
            //   child: Image.network(
            //     productImage,
            //     height: 80,
            //   ),
            // ),
            Positioned(
              top: 150,
              right: 60,
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
            Positioned(
              top: 190,
              right: 70,
              child: Text(
                '\₹$price',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
