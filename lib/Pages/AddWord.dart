import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yofy/Services/db_helper.dart';
import 'package:yofy/main.dart';
import 'package:yofy/object/note.dart';

class AddWord extends StatefulWidget {

  @override
  _AddWordState createState() => _AddWordState();
 
  }
  

class _AddWordState extends State<AddWord> {
  final wordController = TextEditingController();
  final eTrasnlateController = TextEditingController();
  final hTrasnlateController = TextEditingController();
  DBHelper help = DBHelper();
  
  
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
    return WillPopScope(
      onWillPop: () {
        print("finish writng women");
      },
    child: SafeArea(
          child: Scaffold(
         appBar: AppBar(
          title: Text("Add word"),
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
                  child:TextField(
                    controller: eTrasnlateController,
                    decoration:InputDecoration(hintText: "Please enter a english translation" ),
                  ),
            ),
            RaisedButton(
                  elevation: 4,
                  splashColor: Colors.blueGrey,
                  onPressed: () => {
                    setState((){
                      _save();
                    }),
                    Navigator.pop(context),
                  },
                  child:Text("     Save     "),
                ),
            Container(
              height: 50,
              width: 250,
            ),
          ],
        ) ,
      ),
      ),
   ) );
  }
  void _save() async {
    int result;
    Note b = new Note(0, eTrasnlateController.text, hTrasnlateController.text); ///////change id
    result = await help.insertNote(b);
  }

}