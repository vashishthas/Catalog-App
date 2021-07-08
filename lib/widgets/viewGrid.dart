import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';

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
            crossAxisCount: 2),
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
                  ),
                  footer: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text(
                      item.price.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Image.network(item.image),
                  )));
        });
  }
}