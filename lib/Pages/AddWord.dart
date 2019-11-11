import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AddWord extends StatefulWidget {

  @override
  _AddWordState createState() => _AddWordState();
 
  }
  

class _AddWordState extends State<AddWord> {
  final wordController = TextEditingController();
  final trasnlateController = TextEditingController();
  
  openUrl()async {
    print(wordController.text);
   var word = wordController.text;
   var url = "https://translate.google.co.il/?hl=iw#view=home&op=translate&sl=iw&tl=en&text=$word";
   if (await canLaunch(url)) {
    await launch(url); 
  } 
  else {
    throw 'Could not launch $url';
  }
  }
  
  Widget build(BuildContext context) { 
    return SafeArea(
          child: Scaffold(
         appBar: AppBar(
          title: Text("banana"),
        ),
        body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           Container(
              height: 50,
              width: 250,
            ),
            SizedBox(
              height: 50,
              width: 250 ,
              child: TextField(
                controller: wordController,
                decoration:InputDecoration(hintText: "Please enter a word" ),
              ),
            ),
            RaisedButton(
              elevation: 4,
              splashColor: Colors.blueGrey,
              onPressed: () => openUrl(),
              child:Text("Translate"),
            ),
            Container(
              height: 50,
              width: 250,
            ),
                      SizedBox(
              height: 50,
              width: 250 ,
              child: TextField(
                controller: trasnlateController,
                decoration:InputDecoration(hintText: "Please enter a translation" ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
            ),
          ],
        ) ,
      ),
       floatingActionButton: FloatingActionButton(
              onPressed: () => {},  ////////////SQL
              tooltip: 'increment',
            ),
      ),
    );
  }

}