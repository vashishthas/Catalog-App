import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';

import 'add_to_cart.dart';

class ViewGrid extends StatelessWidget {
  const ViewGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: CatalogModel.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            crossAxisCount: MediaQuery.of(context).size.width~/300),
        itemBuilder: (context, index) {
          final item = CatalogModel.items[index];
          return Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: GridTile(
                header: Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                footer: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text("\$${item.price.toString()}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      Spacer(),
                      AddToCart(item: item)
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Center(
                        child: Hero(
                          tag: item.id,
                          child: Image.network(
                            item.image,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}