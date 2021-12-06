import 'package:flutter/material.dart';

import 'custom_expansion_tile_widget.dart';

class ImplicitAnimationsPage extends StatefulWidget {
  const ImplicitAnimationsPage({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimationsPage> createState() => _ImplicitAnimationsPageState();
}

class _ImplicitAnimationsPageState extends State<ImplicitAnimationsPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Implicit Animations')),
      body: ListView(children: [
        // ExpansionTile(
        //   title: ListTile(title: Text('Expansion Tile Original')),
        //   children: List.generate(
        //     5,
        //     (index) => ListTile(title: Text('Item $index')),
        //   ),
        // ),
        CustomExpansionTileWidget(
          isExpanded: isExpanded,
          onChanged: (value) {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          title: ListTile(title: Text('Custom Expansion Tile')),
          children: List.generate(
            5,
            (index) => ListTile(title: Text('Item $index')),
          ),
        ),
        ListTile(title: Text('Outras coisas')),
        IconButton(
          icon: Icon(Icons.keyboard_hide_sharp),
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        )
      ]),
    );
  }
}
