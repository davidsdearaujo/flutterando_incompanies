import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> sizeAnimation;
  late final Animation<Color?> colorAnimation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    sizeAnimation = Tween<double>(begin: 50, end: 100).animate(controller);
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page 2')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (controller.value == 0) {
              controller.animateTo(0.5);
            } else {
              controller.reverse();
            }
          },
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Container(
                width: sizeAnimation.value,
                height: sizeAnimation.value,
                color: colorAnimation.value,
              );
            },
          ),
        ),
      ),
    );
  }
}
