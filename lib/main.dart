import 'package:flutter/material.dart';
import 'package:game_of_life/screens/simulator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Game Of Life",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String row = "", col = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Conway's Game of Life",
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Enter no. of rows"),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  row = value;
                },
                onSubmitted: (value) {
                  row = value;
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text("Enter no. of columns"),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  col = value;
                },
                onSubmitted: (value) {
                  col = value;
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              child: Text("Create a simulator"),
              onPressed: () {
                if (row.length == 0 || col.length == 0) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text("Fields can not be empty"),
                  ));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Simulator(col: int.parse(col), row: int.parse(row))));
                }
              },
            )
          ],
        ));
  }
}
