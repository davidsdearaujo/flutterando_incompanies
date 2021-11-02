import 'package:flutter/material.dart';

class ControlledAnimationsPage extends StatefulWidget {
  const ControlledAnimationsPage({Key? key}) : super(key: key);

  @override
  _ControlledAnimationsPageState createState() =>
      _ControlledAnimationsPageState();
}

class _ControlledAnimationsPageState extends State<ControlledAnimationsPage>
    with TickerProviderStateMixin {
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
      appBar: AppBar(title: Text('Controlled Animations')),
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
                child: Text('Tap-me'),
              );
            },
          ),
        ),
      ),
    );
  }
}
