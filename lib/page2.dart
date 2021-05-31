import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final int index;

  const Page2({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page2')),
      body: Column(
        children: [
          Hero(
            tag: 'deivao$index',
            child: Image.network(
              'https://miro.medium.com/fit/c/344/344/1*EfeSssKoh5_BjGM0AdM1oA.png',
              width: 150,
              height: 150,
            ),
          ),
          Expanded(
            child: FutureBuilder<bool>(
              future: Future.delayed(Duration(seconds: 3), () => true),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(title: Text('Item $index'));
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
