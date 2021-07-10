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
  // const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Total",
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

class CartList extends StatelessWidget {
  const CartList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.done),
            title: Text("Item $index"),
            trailing: Icon(Icons.remove_circle_outline),
          );
        });
  }
}
