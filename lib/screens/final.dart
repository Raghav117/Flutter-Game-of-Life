import 'dart:async';

import 'package:flutter/material.dart';

class Final extends StatefulWidget {
  final List<List<int>> l;
  final int row, col;

  const Final({Key key, this.l, this.row, this.col}) : super(key: key);

  @override
  _FinalState createState() => _FinalState(l, row, col);
}

class _FinalState extends State<Final> {
  var height;
  var width;
  var area;
  var ratio;
  var cheight;
  var cwidth;
  var cratio;
  final int row, col;
  List<List<int>> l;
  Timer timer;

  _FinalState(this.l, this.row, this.col);

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 500), (Timer t) => start());
    super.initState();
  }

  start() {
    int i, j;
    List<List<int>> k =
        List<List<int>>.generate(row, (_) => List<int>.generate(col, (_) => 0));
    i = -1;
    j = -1;

    while (++i < row) {
      j = -1;
      while (++j < col) {
        k[i][j] = game(i, j);
      }
    }

    setState(() {
      l = k;
    });
  }

  int game(int m, int n) {
    int f, g;
    int sum = 0;

    for (f = -1; f < 2; ++f) {
      for (g = -1; g < 2; ++g) {
        if (f != 0 || g != 0)
          sum = sum + l[(f + m + row) % row][(g + n + col) % col];
      }
    }

    if (sum > 3 || sum < 2) return 0;

    if (sum == 3) return 1;

    return l[m][n];
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height - 23;
    width = MediaQuery.of(context).size.width;
    cheight = height / row;
    cwidth = width / col;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white54,
        body: Container(
            child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: col,
              childAspectRatio: cwidth / cheight,
              mainAxisSpacing: 0.5,
              crossAxisSpacing: 0.5),
          itemCount: row * col,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: l[index ~/ col][index % col] == 0
                  ? Colors.white
                  : Colors.black,
            );
          },
        )),
      ),
    );
  }
}
