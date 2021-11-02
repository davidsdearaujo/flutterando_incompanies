import 'package:flutter/material.dart';

import 'page2.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  bool isExpanded = false;
  final animationDuration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero')),
      body: Column(
        children: List.generate(
          10,
          (index) => ListTile(
            title: Text('Item $index'),
            leading: Hero(
              tag: 'null$index',
              child: Image.network(
                'https://yt3.ggpht.com/ytc/AKedOLQi9UpqABoSJK_Dw9LsULNHizpYfEaRya5437Wv=s900-c-k-c0x00ffffff-no-rj',
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Page2(index: index),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
