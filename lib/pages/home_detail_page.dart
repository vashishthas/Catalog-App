import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  final String dummyText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam non lobortis eros. In mollis quam sed ante molestie, et molestie lectus mattis. Etiam at imperdiet arcu. Maecenas at arcu quis sapien accumsan suscipit. Duis pulvinar in lorem vel fermentum. Vestibulum eget purus sit amet tortor consequat bibendum quis sit amet nunc. Nullam sed vulputate ligula, finibus commodo enim. Mauris vestibulum fringilla lacus dignissim malesuada. Fusce at lacus eu dolor efficitur imperdiet. Nulla pretium velit non tincidunt volutpat.';

  const HomeDetailPage({Key key, @required this.catalog}) : super(key: key);
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 8.0, right: 8),
          child: Column(children: [
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                child:
                    Hero(tag: catalog.id, child: Image.network(catalog.image))),
            // SizedBox(height: 10),
            Expanded(
              child: ClipPath(
                clipper: RoundedClipper(),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          catalog.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(height: 10),
                        Text(
                          catalog.desc,
                          style: TextStyle(fontSize: 20),
                        ),
                        // SizedBox(height: 10),
                        Spacer(
                          flex: 1,
                        ),
                        Text(dummyText),
                        SizedBox(height: 5),
                        Spacer(flex: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${catalog.price.toString()}",
                              style: TextStyle(color: Colors.red, fontSize: 30),
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        StadiumBorder())),
                                child: Text("BUY"))
                          ],
                        ),
                        Spacer(
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
