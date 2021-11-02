import 'package:flutter/material.dart';

import 'page_2.dart';

class HomeListPage extends StatelessWidget {
  const HomeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home List Page')),
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
            leading: Hero(
              tag: 'blue-square-$index',
              child: Container(width: 10, height: 10, color: Colors.blue),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2(index)));
            },
          );
        },
      ),
    );
  }
}
