import 'package:flutter/material.dart';
import 'package:flutterando_in_companies/page_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isTapped = false;

  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    sizeAnimation = Tween<double>(begin: 50, end: 100).animate(controller);
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);
  }

  void onTap() {
    if (controller.value > 0) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home page')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2(0)));
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: onTap,
              child: TweenAnimationBuilder<double>(
                child: Text('Texto Qualquer'),
                duration: Duration(seconds: 1),
                curve: Curves.bounceOut,
                tween: Tween<double>(begin: 50, end: 100),
                builder: (context, value, child) {
                  return Container(
                    width: value,
                    height: value,
                    color: colorAnimation.value,
                    child: child,
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: AnimatedBuilder(
                animation: controller,
                child: Text('Texto Qualquer'),
                builder: (context, child) {
                  return Container(
                    width: sizeAnimation.value,
                    height: sizeAnimation.value,
                    color: colorAnimation.value,
                    child: child,
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isTapped = !isTapped;
                });
              },
              child: Hero(
                tag: 'blue-square',
                child: AnimatedContainer(
                  width: isTapped ? 50 : 100,
                  height: isTapped ? 50 : 100,
                  color: isTapped ? Colors.blue : Colors.red,
                  duration: Duration(seconds: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
