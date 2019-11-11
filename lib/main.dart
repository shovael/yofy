import 'package:flutter/material.dart';
import 'package:yofy/Pages/AddWord.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 15,
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () => {},
                  child: Text(
                    "List",
                    ),
                ),
                RaisedButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddWord() ))
                  },
                  child: Text(
                    "Add word",
                    ),
                ),
                RaisedButton(
                  onPressed: () => {},
                  child: Text(
                    "Practice",
                    ),
                ),
                 Container(
                  width: 15,
                  height: 15,
                ),
              ],)
          ],
        ),
      ),
    );
  }
}
