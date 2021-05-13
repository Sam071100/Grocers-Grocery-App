part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object> get props => [];
}

// Inital Event when product page is loaded
class ShopPageInitializedEvent extends ShopEvent {}

// Event when add to cart button is pressed
class ItemAddingCartEvent extends ShopEvent {
  List<ShopItem> cartItems;

  ItemAddingCartEvent({this.cartItems});
}

// Event when the item is added to the cart
class ItemAddedCartEvent extends ShopEvent {
  List<ShopItem> cartItems;

  ItemAddedCartEvent({this.cartItems});
}

// Event when the item is deleted from the cart
class ItemDeleteCartEvent extends ShopEvent {
  List<ShopItem> cartItems;
  int index;
  ItemDeleteCartEvent({this.cartItems, this.index});
}
