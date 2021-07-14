import 'dart:convert';

import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/widgets/catalogHeader.dart';
import 'package:catalog/widgets/catalog_list.dart';
import 'package:flutter/material.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
    String url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
    await Future.delayed(Duration(seconds: 2));
    final response = await http.get(Uri.parse(url));
    var catalogJson = response.body;
    // var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
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
      floatingActionButton: Stack(
        alignment: Alignment(1.4, -1.5),
        children: [
          FloatingActionButton(
            backgroundColor: Color(0xff403b58),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            child: Icon(Icons.shopping_cart),
          ),
          Consumer<CartModel>(builder: (_, cartmodel, __) {
            return cartmodel.items.length != 0
                ? Container(
                    height: 10,
                    width: 10,
                    // This is your Badge
                    child: Center(
                        // Here you can put whatever content you want inside your Badge
                        child: Text(cartmodel.items.length.toString(),
                            style: TextStyle(color: Colors.white))),
                    padding: EdgeInsets.all(8),
                    constraints: BoxConstraints(minHeight: 32, minWidth: 32),
                    decoration: BoxDecoration(
                      // This controls the shadow
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 5,
                            color: Colors.black.withAlpha(50))
                      ],
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blue, // This would be color of the Badge
                    ),
                  )
                : SizedBox();
          })
        ],
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
