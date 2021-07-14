import 'package:catalog/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  // const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartmodel = Provider.of<CartModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
      ),
      body: cartmodel.items.length == 0
          ? Center(
              child: Container(
                // width: MediaQuery.of(context).size.width * 0.7,
                // width: 100,
                color: Colors.white,
                child: Column(
                  children: [
                    Spacer(),
                    Image.asset('assets/images/emptyCart.png'),
                    Text(
                      "Cart is empty",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Spacer()
                  ],
                ),
              ),
            )
          : Column(children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(32.0), child: CartList()
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
  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    final cartmodel = Provider.of<CartModel>(context);
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$${cartmodel.totalPrice}",
            style: TextStyle(fontSize: 30),
          ),
          // ),
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

class CartList extends StatelessWidget {
  CartList({Key key}) : super(key: key);

//   @override
//   _CartListState createState() => _CartListState();
// }

// class _CartListState extends State<CartList> {
  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    final cartmodel = Provider.of<CartModel>(context);
    return
        // cartmodel.items.length == 0
        // ? Center(
        //     child: Container(
        //       color: Colors.white,
        //       child: Column(
        //         children: [
        //           Spacer(),
        //           Image.asset('assets/images/emptyCart.png'),
        //           Text(
        //             "Cart is empty",
        //             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        //           ),
        //           Spacer()
        //         ],
        //       ),
        //     ),
        //   )
        // :
        ListView.builder(
            itemCount: cartmodel.items?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Image.network(cartmodel.items[index].image),
                  title: Text("${cartmodel.items[index].name}"),
                  trailing: InkWell(
                      onTap: () {
                        cartmodel.remove(cartmodel.items[index]);
                      },
                      child: Icon(
                        Icons.remove_circle_outline,
                      )),
                ),
              );
            });
  }
}
