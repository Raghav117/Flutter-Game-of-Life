import 'package:flutter/material.dart';

import 'final.dart';

class Simulator extends StatefulWidget {
  final int row, col;

  const Simulator({Key key, this.row, this.col}) : super(key: key);
  @override
  _SimulatorState createState() => _SimulatorState(row, col);
}

class _SimulatorState extends State<Simulator> {
  final int row, col;
  List<List<int>> l;

  var height;
  var width;

  var cheight;

  var cwidth;

  @override
  void initState() {
    l = List<List<int>>.generate(row, (_) => List<int>.generate(col, (_) => 0));

    super.initState();
  }

  _SimulatorState(this.row, this.col);

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height - 100;
    width = MediaQuery.of(context).size.width;
    cheight = height / row;
    cwidth = width / col;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white30,
        body: Column(
          children: <Widget>[
            Expanded(
                // height: height,
                // width: width,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: col,
                      childAspectRatio: cwidth / cheight,
                      mainAxisSpacing: 0.5,
                      crossAxisSpacing: 0.5),
                  itemCount: row * col,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        l[index ~/ col][index % col] =
                            l[index ~/ col][index % col] == 1 ? 0 : 1;
                        setState(() {});
                      },
                      child: Container(
                        color: l[index ~/ col][index % col] == 0
                            ? Colors.white
                            : Colors.black,
                      ),
                    );
                  },
                )),
            FlatButton(
              child: Text("Run Game Of Life"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Final(
                          col: col,
                          l: l,
                          row: row,
                        )));
              },
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
