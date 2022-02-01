import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/page2.dart';
import 'package:test2/page3.dart';
import 'package:test2/page4.dart';
import 'package:test2/page5.dart';
import 'package:test2/page6.dart';
import 'package:test2/page7.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page7(),
      routes: {
        Page2.id: (context) => Page2(),
        Page3.id: (context) => Page3(),
        Page4.id: (context) => Page4(),
        Page5.id: (context) => Page5(),
        Page6.id: (context) => Page6(),
        Page7.id: (context) => Page7(),
      },
    );
  }
}
