import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog}) : super(key: key);
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [Hero(
            tag: catalog.id,
            child: Image.network(catalog.image))]),
        ),
      ),
    );
  }
}
