import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Vashishtha"),
                  accountEmail: Text("v@gmail.com"),
                  currentAccountPicture: CircleAvatar(),
                )),
            DrawerTile(
              text: "Home",
              icon: CupertinoIcons.home,
            ),
            DrawerTile(
              text: "Profile",
              icon: CupertinoIcons.profile_circled,
            ),
            DrawerTile(
              text: "Email me",
              icon: CupertinoIcons.mail,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    this.text,
    this.icon,
    Key key,
  }) : super(key: key);
  final String text;
  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
