import 'package:flutter/material.dart';

import 'page2.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;
  final animationDuration = const Duration(seconds: 1);
  final animationCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo')),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Page2(index: index)));
          },
          title: Text('item $index'),
          leading: Hero(
            tag: 'deivao$index',
            child: Image.network(
              'https://miro.medium.com/fit/c/344/344/1*EfeSssKoh5_BjGM0AdM1oA.png',
              width: 150,
              height: 150,
            ),
          ),
        );
      }),
    );
  }
}
