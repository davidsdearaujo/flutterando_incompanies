import 'package:flutter/material.dart';

import 'details_page.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  void dispose() {
    super.dispose();

    PaintingBinding.instance?.imageCache?.clear();
    PaintingBinding.instance?.imageCache?.clearLiveImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(index: index),
                ),
              );
            },
            title: Hero(
              tag: 'item-image-hero-tag-$index',
              child: Material(
                type: MaterialType.transparency,
                child: Text('Item $index'),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://yt3.ggpht.com/ytc/AKedOLQi9UpqABoSJK_Dw9LsULNHizpYfEaRya5437Wv=s900-c-k-c0x00ffffff-no-rj',
              ),
            ),
          );
        },
      ),
    );
  }
}
