import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  static const String id = "Page3";

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size> _animation;
  int num=0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
      reverseDuration: Duration(seconds: 2),
    )..addStatusListener((AnimationStatus status) {
      if(AnimationStatus.completed == status){
        _controller.reverse();
      }else{
        _controller.forward();
      }
    });
    _animation = Tween<Size>(begin: Size(150, 150), end: Size(250, 250))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubicEmphasized))
    ..addStatusListener((AnimationStatus status) {
      if(status==AnimationStatus.completed){
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if(num == 0){
                  _controller.forward();
                }else{
                  _controller.stop();
                }
                num == 0 ? num = 1 : num = 0;
                print(num);
              });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (cth, ch) => Container(
            color: Colors.deepPurple,
            width: _animation.value.width,
            height: _animation.value.height,
            alignment: Alignment.center,
            child: Text(
              "Flutter",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
