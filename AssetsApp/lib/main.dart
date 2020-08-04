import 'package:flutter/material.dart';
import 'ui/home.dart';

main() {
  runApp(myApp());
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Player App"),
          backgroundColor: HexColor("322f3d"),
        ),
        body: mybody(),
        backgroundColor: HexColor("59405c"),
      ),
    );
  }
}
