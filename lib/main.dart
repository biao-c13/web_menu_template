import 'package:flutter/material.dart';
import 'package:web_menu_template/costants/palette.dart';
import 'package:web_menu_template/menu/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        primarySwatch: Palette.colorPrimarySwatch,
      ),
      home: const MenuPage(),
    );
  }
}
