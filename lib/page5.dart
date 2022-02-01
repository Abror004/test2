import 'package:flutter/material.dart';

class Page5 extends StatefulWidget {
  static const String id = "Page5";

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _slideAnimation = Tween<double>(
      begin: 50,
      end: 200,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.1, curve: Curves.easeInBack),
      )..addStatusListener((AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            _controller.repeat(reverse: true);
          }
        }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _slideAnimation,
        builder: (ctx, ch) => Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(
            top: _slideAnimation.value,
            left: _slideAnimation.value,
          ),
          child: Text(
            "Flutter",
            style: TextStyle(
                color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        child: Icon(Icons.forward),
      ),
    );
  }
}
