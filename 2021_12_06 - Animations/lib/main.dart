import 'package:flutter/material.dart';

import '1_implicit_animations/implicit_animations_page.dart';
import '2_hero/hero_page.dart';
import '3_controller_animations/controlled_animations_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    precacheImage(
      NetworkImage(
        'https://yt3.ggpht.com/ytc/AKedOLQi9UpqABoSJK_Dw9LsULNHizpYfEaRya5437Wv=s900-c-k-c0x00ffffff-no-rj',
      ),
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(title: Text('Flutterando in companies')),
          body: Column(
            children: [
              ListTile(
                title: Text('1 - Implicit Animations'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImplicitAnimationsPage(),
                  ),
                ),
              ),
              ListTile(
                title: Text('2 - Hero'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeroPage()),
                ),
              ),
              ListTile(
                title: Text('3 - Controlled Animations'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ControlledAnimationsPage(),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
