import 'dart:convert';

import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/item_widget.dart';
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
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async{
    var catalogJson= await rootBundle.loadString("assets/files/catalog.json");
    print("a1"+catalogJson);
    var decodedData= jsonDecode(catalogJson);
    print("a2");
    print(decodedData);
    var productsData= decodedData["products"];
    print("a3");
    print(productsData);
   }

  @override
  Widget build(BuildContext context) {
    final dummyList=List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Catalog App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            // itemCount: CatalogModel.items.length,
            itemCount: dummyList.length,
            itemBuilder: (context,index){
              return ItemWidget(
                // item: CatalogModel.items[index]
                item: dummyList[index]
              );
            }),
        ),
        drawer:MyDrawer(),
      );
  }
}
