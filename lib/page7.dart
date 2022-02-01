import 'package:flutter/material.dart';

class Page7 extends StatefulWidget {
  static const String id = "Page7";

  @override
  _Page7State createState() => _Page7State();
}

class _Page7State extends State<Page7> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Size> _animation3;
  late Animation _animation4;
  late AnimationStatus _animationStatus = AnimationStatus.dismissed;

  // late Animation<double> _animation3;
  late double length;

  late bool res = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation1 = Tween<double>(
      begin: 50,
      end: 130,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.elasticIn),
      ),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat(reverse: true);
        }
      });

    _animation2 = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat(reverse: true);
        }
      });

    _animation3 =
        Tween<Size>(begin: Size(150, 150), end: Size(250, 250)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.elasticIn),
      ),
    )..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              _controller.repeat(reverse: true);
            }
          });

    _animation4 = Tween(begin: 0.0, end: 1.0).animate(_controller)
    ..addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _animation1,
                builder: (ctx, ch) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: _animation1.value),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: SlideTransition(
                  position: _animation2,
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.blue,
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _animation3,
                builder: (context, animatorState) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: Container(
                    height: _animation3.value.height,
                    width: _animation3.value.width,
                    color: Colors.black26,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.002)
                    ..rotateX(3.14 * _animation4.value)
                    ..rotateY(3.14 * _animation4.value),
                  child: Container(
                    color: Colors.blueAccent.withOpacity(0.3),
                    width: 200,
                    height: 200,
                    child: Icon(
                      Icons.accessibility_new,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ],
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
