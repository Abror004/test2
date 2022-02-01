import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/page3.dart';

class Page2 extends StatefulWidget {
  static const String id = "Page2";

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NavigationRail", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          Icon(Icons.shopping_basket),
          SizedBox(width: 10,height: 5,),
          Icon(Icons.notifications),
          SizedBox(width: 10,),
        ],
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(child: Container(),),
          ],
        ),
      ),
      endDrawer: Container(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavigationRail(
              selectedIndex: count,
              minWidth: 30,
              minExtendedWidth: 30,
              onDestinationSelected: (index) {
                setState(() {
                  count = index;
                  if(count==2){
                    Navigator.pushReplacement(context, MaterialPageRoute (
                      builder: (BuildContext context) => Page3(),
                    ),);
                  }
                });
              },
              backgroundColor: Colors.black,
              unselectedIconTheme: IconThemeData(
                color: Colors.white,
                size: 40,
                opacity: 20,
              ),
              selectedIconTheme: IconThemeData(
                  color: Colors.green,
                  size: 50,
                  opacity: 20
              ),
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.group),
                  label: SizedBox.shrink(),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.forward),
                  label: SizedBox.shrink(),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_outlined),
                  label: SizedBox.shrink(),
                  selectedIcon: Text("dwee"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
