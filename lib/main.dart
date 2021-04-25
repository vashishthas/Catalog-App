import 'package:catalog/pages/home_page.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:catalog/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        fontFamily: GoogleFonts.lato().fontFamily
        ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context)=>LoginPage(),
        MyRoutes.loginRoute: (context)=>LoginPage(),
        MyRoutes.homeRoute: (context)=>HomePage()
        // "/home": (context)=>HomePage(),
      },
    ); 
  }
}