import 'package:catalog/models/catalog.dart';
import 'package:catalog/pages/home_detail_page.dart';
import 'package:catalog/widgets/catalog_item.dart';
import 'package:flutter/material.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(
                            catalog: catalog,
                          )));
            },
            child: CatalogItem(
              catalog: catalog,
            ),
          );
          // ItemWidget(item: catalog);
        });
  }
}
