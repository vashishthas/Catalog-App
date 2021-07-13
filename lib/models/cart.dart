import 'package:catalog/models/catalog.dart';
import 'package:flutter/cupertino.dart';

class CartModel with ChangeNotifier {
  // // static final cartModel = CartModel._internal();

  // // CartModel._internal();

  // // factory CartModel() => cartModel;

  // catalog field
  CatalogModel _catalog;

  //collection of ID's - store ID's of each item
  final List<int> _itemIds = [];

  // Get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice {
    // notifyListeners();
    return items.fold(0, (total, current) => total + current.price);
  }

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
