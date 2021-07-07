import 'dart:convert';

import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:flutter/services.dart';

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
    print("a1" + catalogJson);
    var decodedData = jsonDecode(catalogJson);
    print("a2");
    print(decodedData);
    var productsData = decodedData["products"];
    print("a3");
    print(productsData);
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                Builder(
                    builder: (context) => IconButton(
                        icon: Icon(Icons.menu, color: Colors.lightBlue[900]),
                        onPressed: () => Scaffold.of(context).openDrawer())),
                Text("Catalog App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.lightBlue[900],
                        letterSpacing: 2,
                        fontSize: 30)),
                        
              ]),

              child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  ? ListView.builder(
                      itemCount: CatalogModel.items.length,
                      // itemCount: dummyList.length,
                      itemBuilder: (context, index) {
                        return ItemWidget(item: CatalogModel.items[index]
                            // item: dummyList[index]
                            );
                      })
                  : Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.red,
                      ),
                    ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
