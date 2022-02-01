import 'package:flutter/material.dart';

class Page6 extends StatefulWidget {
  static const String id = "Page6";

  @override
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  late Animation<Offset> _rotateAnimation2;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _size;


  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _rotateAnimation2 = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(0.0, 0.001),
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.0,0.4,curve: Curves.linear),),);

    _rotateAnimation = Tween<double>(end: 0.0, begin: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.bounceInOut),
      ),
    );

    _slideAnimation = Tween<double>(end: 100.0, begin: 400.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _opacityAnimation = Tween<double>(end: 1.0, begin: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.0, curve: Curves.slowMiddle),
      ),
    );

    _size = Tween<double>(end: 30, begin: 10).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: _rotateAnimation2,
        child: AnimatedBuilder(
          animation: _slideAnimation,
          builder: (ctx, ch) => Container(
            width: 220,
            height: 100,
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.only(
              left: 75,
              top: _slideAnimation.value,
            ),
            child: RotationTransition(
              turns: _rotateAnimation,
              child: Center(
                child: AnimatedBuilder(
                  animation: _size,
                  builder: (ctx, ch) => Text(
                    "Animation",
                    style: TextStyle(
                        fontSize: _size.value,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 128, _opacityAnimation.value)),
                  ),
                ),
              ),
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

