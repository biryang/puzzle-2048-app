import 'dart:math';

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

  List<List<int>> gridInt = List.generate(4, (x) => List.generate(4, (y) => 2));

  void addTile() {
    Random random = new Random();
    List empty = [];
    for (int x = 0; x < 4; x++) {
      for (int y = 0; y < 4; y++) {
        if (gridInt[x][y] == 0) {
          empty.add([x, y]);
        }
      }
    }

    print(empty);
    int numRandom = random.nextInt(empty.length);
    int x = empty[numRandom][0];
    int y = empty[numRandom][1];
    gridInt[x][y] = 2;
  }

  void mergeUp() {
    bool addCheck = false;
    print('be');
    print(gridInt);
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 4; x++) {
        if (gridInt[y][x] == gridInt[y + 1][x]) {
          gridInt[y][x] = gridInt[y][x] + gridInt[y + 1][x];
          gridInt[y + 1][x] = 0;
          addCheck = true;
        }
      }
    }
    for (int n = 0; n < 4; n++) {
      for (int y = 0; y < 3; y++) {
        for (int x = 0; x < 4; x++) {
          if (gridInt[y][x] == 0) {
            gridInt[y][x] = gridInt[y + 1][x];
            gridInt[y + 1][x] = 0;
            addCheck = true;
          }
        }
      }
    }
    print('af');
    gridInt.forEach((element) {
      print(element);
    });
    if (addCheck = true) {
      addTile();
    }
  }

  void mergeDown() {
    bool addCheck = false;
    print('be');
    print(gridInt);
    for (int y = 3; y > 0; y--) {
      for (int x = 0; x < 4; x++) {
        if (gridInt[y][x] == gridInt[y - 1][x]) {
          gridInt[y][x] = gridInt[y][x] + gridInt[y - 1][x];
          gridInt[y - 1][x] = 0;
          addCheck = true;
        }
      }
    }
    for (int n = 0; n < 4; n++) {
      for (int y = 3; y > 0; y--) {
        for (int x = 0; x < 4; x++) {
          if (gridInt[y][x] == 0) {
            gridInt[y][x] = gridInt[y - 1][x];
            gridInt[y - 1][x] = 0;
            addCheck = true;
          }
        }
      }
    }
    print('af');
    gridInt.forEach((element) {
      print(element);
    });

    if (addCheck = true) {
      addTile();
    }
  }

  void mergeLeft() {
    bool addCheck = false;
    print('be');
    print(gridInt);
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 4; x++) {
        if (gridInt[x][y] == gridInt[x][y + 1]) {
          gridInt[x][y] = gridInt[x][y] + gridInt[x][y + 1];
          gridInt[x][y + 1] = 0;
          addCheck = true;
        }
      }
    }
    for (int n = 0; n < 4; n++) {
      for (int y = 0; y < 3; y++) {
        for (int x = 0; x < 4; x++) {
          if (gridInt[x][y] == 0) {
            gridInt[x][y] = gridInt[x][y + 1];
            gridInt[x][y + 1] = 0;
            addCheck = true;
          }
        }
      }
    }
    print('af');
    gridInt.forEach((element) {
      print(element);
    });

    if (addCheck = true) {
      addTile();
    }
  }

  void mergeRight() {
    bool addCheck = false;
    print('be');
    print(gridInt);
    for (int y = 3; y > 0; y--) {
      for (int x = 0; x < 4; x++) {
        if (gridInt[x][y] == gridInt[x][y - 1]) {
          gridInt[x][y] = gridInt[x][y] + gridInt[x][y - 1];
          gridInt[x][y - 1] = 0;
          addCheck = true;
        }
      }
    }
    for (int n = 0; n < 4; n++) {
      for (int y = 3; y > 0; y--) {
        for (int x = 0; x < 4; x++) {
          if (gridInt[x][y] == 0) {
            gridInt[x][y] = gridInt[x][y - 1];
            gridInt[x][y - 1] = 0;
            addCheck = true;
          }
        }
      }
    }
    print('af');
    gridInt.forEach((element) {
      print(element);
    });

    if (addCheck = true) {
      addTile();
    }
  }

  @override
  Widget build(BuildContext context) {
    final gridSize = MediaQuery.of(context).size.width - 16 * 2;
    final tileSize = (gridSize - 4.0 * 2) / 4;
    List<Widget> stackItems = [];

    grid.forEach((x) {
      x.forEach((y) {
        stackItems.add(Tile(
          x: tileSize * x[0].x,
          y: tileSize * y.y,
          value: gridInt[y.y][x[0].x] != 0 ? '${gridInt[y.y][x[0].x]}' : '',
          tileSize: tileSize,
          color: Color(int.parse(
              '0xaf59${int.parse('${gridInt[y.y][x[0].x]}', radix: 16) * 5}95')),
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
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.velocity.pixelsPerSecond.dy < -250) {
                print('up');
                setState(() {
                  mergeUp();
                });
              } else if (details.velocity.pixelsPerSecond.dy > 250) {
                print('down');
                setState(() {
                  mergeDown();
                });
              }
            },
            onHorizontalDragEnd: (details) {
              if (details.velocity.pixelsPerSecond.dx < -1000) {
                print('left');
                setState(() {
                  mergeLeft();
                });
              } else if (details.velocity.pixelsPerSecond.dx > 1000) {
                print('right');
                setState(() {
                  mergeRight();
                });
              }
            },
            child: Stack(
              children: stackItems,
            ),
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
          color: color,
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
