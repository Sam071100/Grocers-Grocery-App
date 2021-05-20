class ShopData {
  List<ShopItem> shopitems; // Datatype for defining list of items

  ShopData({this.shopitems});

  void addProduct(ShopItem p) {
    shopitems.add(p);
  }

  void removeProduct(ShopItem p) {
    shopitems.add(p);
  }
}

//Datatype of the Product
class ShopItem {
  String imageUrl;
  String thumbnail;
  String title;
  double price;
  int quantity;
  bool fruits;
  String category;

  ShopItem(
      {this.imageUrl,
      this.thumbnail,
      this.price,
      this.quantity,
      this.title,
      this.fruits,
      this.category});
}
