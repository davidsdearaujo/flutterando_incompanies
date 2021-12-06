import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final int index;
  const DetailsPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'item-image-hero-tag-$index',
              child: Material(
                type: MaterialType.transparency,
                child: Text('Item $index'),
              ),
            ),
            Image.network(
              'https://yt3.ggpht.com/ytc/AKedOLQi9UpqABoSJK_Dw9LsULNHizpYfEaRya5437Wv=s900-c-k-c0x00ffffff-no-rj',
            ),
          ],
        ),
      ),
    );
  }
}
