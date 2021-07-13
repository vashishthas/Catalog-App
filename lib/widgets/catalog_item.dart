import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';

import 'add_to_cart.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.grey,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Center(
                child: Hero(
                  tag: catalog.id,
                  child: Image.network(
                    catalog.image,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(
                catalog.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(catalog.desc),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("\$${catalog.price}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: AddToCart(item: catalog),
                )
              ])
            ]))
      ]),
    );
  }
}

// class AddToCart extends StatefulWidget {
//   final Item catalog;
//   const AddToCart({
//     this.catalog,
//     Key key,
//   }) : super(key: key);

//   @override
//   _AddToCartState createState() => _AddToCartState();
// }

// class _AddToCartState extends State<AddToCart> {
//   // bool isInCart = false;
//   final _cart = CartModel();
//   // final _catalog=CatalogModel();
//   @override
//   Widget build(BuildContext context) {
//     bool isInCart = _cart.items.contains(widget.catalog) ?? false;
//     return ElevatedButton(
//         onPressed: () {
//           if (!isInCart) {
//             print("added to cart");
//             isInCart = true;
//             final _catalog = CatalogModel();
//             _cart.catalog = _catalog;
//             _cart.add(widget.catalog);
//             setState(() {});
//           }
//         },
//         style: ButtonStyle(shape: MaterialStateProperty.all(StadiumBorder())),
//         child: isInCart ? Icon(Icons.done) : Text("Add to cart"));
//   }
// }
