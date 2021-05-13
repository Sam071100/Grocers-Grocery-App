part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

//Initial state of the app
class ShopInitial extends ShopState {}

// State when the product page is loaded
class ShopPageLoadedState extends ShopState {
  ShopData shopData;
  ShopData cartData;

  ShopPageLoadedState({this.cartData, this.shopData});
}

// State when the item is getting added to the cart
class ItemAddingCartState extends ShopState {
  ShopData cartData;
  List<ShopItem> cartItems;

  ItemAddingCartState({this.cartData, this.cartItems});
}

// State when the item is added to the cart
class ItemAddedCartState extends ShopState {
  List<ShopItem> cartItems;

  ItemAddedCartState({this.cartItems});
}

// State when the item is deleted from the cart
class ItemDeletingCartState extends ShopState {
  List<ShopItem> cartItems;

  ItemDeletingCartState({this.cartItems});
}
