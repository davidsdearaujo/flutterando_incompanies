import 'package:flutter/material.dart';

import 'page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;
  final animationDuration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Column(
        children: [
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
          ClipRRect(
            child: AnimatedAlign(
              duration: Duration(seconds: 1),
              curve: Curves.bounceOut,
              heightFactor: isExpanded ? 1 : 0,
              alignment: Alignment.bottomLeft,
              child: Column(
                children: List.generate(
                  10,
                  (index) => ListTile(
                    leading: Hero(
                      tag: 'null$index',
                      child: Image.network(
                        'https://yt3.ggpht.com/ytc/AKedOLQi9UpqABoSJK_Dw9LsULNHizpYfEaRya5437Wv=s900-c-k-c0x00ffffff-no-rj',
                      ),
                    ),
                    title: Text('Child $index'),
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
            ),
          ),
          Container(color: Colors.blue, height: 50),
        ],
      ),
    );
  }
}
