import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(children: [
        Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.menu, color: Colors.lightBlue[900]),
                onPressed: () => Scaffold.of(context).openDrawer())),
        Text("Catalog App",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.lightBlue[900], letterSpacing: 2, fontSize: 30)),
      ]),
    );
  }
}
