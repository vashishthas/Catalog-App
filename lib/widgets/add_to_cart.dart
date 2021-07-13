import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  final Item item;
  const AddToCart({
    @required this.item,
    Key key,
  }) : super(key: key);

//   @override
//   _AddToCartState createState() => _AddToCartState();
// }

// class _AddToCartState extends State<AddToCart> {
  // bool isInCart = false;
  // final _cart = CartModel();
  // final _catalog=CatalogModel();
  
  @override
  Widget build(BuildContext context) {
    final cartmodel=Provider.of<CartModel>(context);
    bool isInCart = cartmodel.items.contains(item) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            print("added to cart");
            isInCart = true;
            final _catalog = CatalogModel();
            cartmodel.catalog = _catalog;
            cartmodel.add(item);
            print(cartmodel.items);
            // setState(() {});
          }
        },
        style: ButtonStyle(shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart ? Icon(Icons.done) : Text("Add to cart"));
  }
}
