import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final int index;
  const Page2(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Center(
        child: Hero(
          tag: 'blue-square-$index',
          child: Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
