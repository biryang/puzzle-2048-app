import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<Tile>> grid = List.generate(4, (y)) =>
  @override
  Widget build(BuildContext context) {
    final gridSize = MediaQuery.of(context).size.width - 16 * 2;
    final tileSize = (gridSize - 4.0 * 2) / 4;
    List<Widget> stackItems = [];

    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Center(
        child: Container(
          width: gridSize,
          height: gridSize,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.brown[100],
          ),
        ),
      ),
    );
  }
}

class Tile {
  final int x;
  final int y;

  int value;

  Tile(this.x, this.y, this.value) {}
}
