import 'dart:convert';

import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/widgets/catalogHeader.dart';
import 'package:catalog/widgets/catalog_list.dart';
import 'package:flutter/material.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 4));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    // print("a1" + catalogJson);
    var decodedData = jsonDecode(catalogJson);
    // print("a2");
    // print(decodedData);
    var productsData = decodedData["products"];
    print("a3");
    // print(productsData);
    // List <Item> list=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList=List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: Icon(Icons.shopping_cart),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  ? Expanded(child: CatalogList())
                  : Expanded(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.red),
                    )
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
