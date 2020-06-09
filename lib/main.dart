import'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

import 'PricePage.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bitcoin Ticker 🤑"),
        ),
        body: PricePage(),
      ),
    );
  }
}
