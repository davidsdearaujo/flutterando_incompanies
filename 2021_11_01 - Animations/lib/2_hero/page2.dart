import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final int index;
  const Page2({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(
        child: Hero(
          tag: 'null$index',
          child: Image.network(
            'https://yt3.ggpht.com/ytc/AKedOLQi9UpqABoSJK_Dw9LsULNHizpYfEaRya5437Wv=s900-c-k-c0x00ffffff-no-rj',
          ),
        ),
      ),
    );
  }
}
