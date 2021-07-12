import 'package:catalog/models/cart.dart';
import 'package:catalog/widgets/add_to_cart.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  // const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
      ),
      body: Column(children: [
        Expanded(
          child: Padding(padding: const EdgeInsets.all(32.0), child: CartList()
              // Placeholder(),
              ),
        ),
        Divider(),
        CartTotal()
      ]),
    );
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({Key key}) : super(key: key);
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$${_cart.totalPrice}",
            style: TextStyle(fontSize: 30),
          ),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Buying not supported"),
              ));
            },
            child: Container(
                color: Theme.of(context).buttonColor,
                height: 40,
                width: 100,
                child: Center(child: Text("BUY"))),
          )
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  CartList({Key key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _cart.items?.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.done),
            title: Text("${_cart.items[index].name}"),
            trailing: InkWell(
                onTap: () {
                  _cart.remove(_cart.items[index]);
                  AddToCart(catalog: _cart.items[index],);
                  setState(() {});
                },
                child: Icon(
                  Icons.remove_circle_outline,
                )),
          );
        });
  }
}
