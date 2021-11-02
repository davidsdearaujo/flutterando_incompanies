import 'package:flutter/material.dart';

class ImplicitAnimationsPage extends StatefulWidget {
  const ImplicitAnimationsPage({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimationsPage> createState() => _ImplicitAnimationsPageState();
}

class _ImplicitAnimationsPageState extends State<ImplicitAnimationsPage> {
  bool isExpanded = false;
  final animationDuration = Duration(milliseconds: 500);
  final animationCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Implicit Animations')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Custom Expansion Tile'),
            selected: isExpanded,
            trailing: AnimatedRotation(
              turns: isExpanded ? 0.5 : 0,
              curve: animationCurve,
              duration: animationDuration,
              child: Icon(Icons.keyboard_arrow_down_rounded),
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
          ClipRRect(
            child: AnimatedAlign(
              duration: animationDuration,
              curve: animationCurve,
              heightFactor: isExpanded ? 1 : 0,
              alignment: Alignment.center,
              child: Column(
                children: List.generate(
                  10,
                  (index) => ListTile(
                    title: Text('Child $index'),
                    trailing: Container(width: 20),
                  ),
                ),
              ),
            ),
          ),
          ExpansionTile(
            title: Text('Expansion Tile'),
            children: List.generate(
              10,
              (index) => ListTile(
                title: Text('Child $index'),
                trailing: Container(width: 20),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            height: 50,
            alignment: Alignment.center,
            child: Text('Footer Content'),
          ),
        ],
      ),
    );
  }
}
