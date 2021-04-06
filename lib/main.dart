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
  List<List<TileData>> grid = List.generate(
      4, (x) => List.generate(4, (y) => TileData(x: x, y: y, value: 0)));

  @override
  Widget build(BuildContext context) {
    print('grid');
    print(grid);
    final gridSize = MediaQuery.of(context).size.width - 16 * 2;
    final tileSize = (gridSize - 4.0 * 2) / 4;
    List<Widget> stackItems = [];

    grid.forEach((x) {
      x.forEach((y) {
        stackItems.add(Tile(
          x: tileSize * x[0].x,
          y: tileSize * y.y,
          value: '${x[0].x} , ${y.y}',
          tileSize: tileSize,
          color: Colors.brown,
        ));
      });
    });

    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Center(
        child: Container(
          width: gridSize,
          height: gridSize,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.brown[100],
          ),
          child: Stack(
            children: stackItems,
          ),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({@required this.tileSize, this.x, this.y, this.value, this.color});

  final double tileSize;
  final double x;
  final double y;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      width: tileSize - 12,
      height: tileSize - 12,
      child: Container(
        alignment: Alignment.center,
        child: Text('$value'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.brown[200],
        ),
      ),
    );
  }
}

class TileData {
  final int x;
  final int y;

  int value;

  TileData({this.x, this.y, this.value});
}
