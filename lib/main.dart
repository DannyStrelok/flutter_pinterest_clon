import 'package:flutter/material.dart';
import 'package:flutter_pinterest/src/screens/pinterest_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PINTEREST CLON',
      home: Scaffold(
        body: PinterestScreen()
      ),
    );
  }
}
