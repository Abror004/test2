import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  static const String id = "Page4";

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(-0.0,-0.9),
      end: Offset(0.0, 0.8),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SlideTransition(
          position: _animation,
          child: Container(
            height: 200,
            width: 200,
            alignment: Alignment.center,
            color: Colors.lightBlue,
            child: Text(
              "Flutter",
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
