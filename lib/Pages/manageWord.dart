import 'package:flutter/material.dart';
import 'package:yofy/object/note.dart';
import 'package:yofy/Services/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'AddWord.dart';
///////////////////////////////////////////change NOteList to ManageWord
class NoteList extends StatefulWidget {

  @override
  _NoteListState createState() => _NoteListState(); 
  }
  

class _NoteListState extends State<NoteList> {
  DBHelper databaseHelper = DBHelper();
  List<Note> noteList;
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    updateListView();
  }
  @override
  Widget build(BuildContext context) {

    if(noteList == null){
      noteList = List<Note>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Managae word"),
      ),
      body: getNoteListview(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => AddWord() ));
      },
      tooltip: 'Add Note',
      child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListview(){
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.white,
          //elevation 2.0
          child: ListTile(
            leading: CircleAvatar( /////////not needed
              backgroundColor: Colors.blue ,
              child: Icon(Icons.adjust),
            ),
            title: Text(this.noteList[position].eWord,style: titleStyle,),
            subtitle: Text(this.noteList[position].hWord),
            trailing: GestureDetector( 
            child: Icon(Icons.delete, color: Colors.black),
            onTap: () => _delete(context, noteList[position]),            
          ),
          ),
        );
      }
    );
  }

  void _delete(BuildContext CONTEXT, Note note) async{
    int result = await databaseHelper.deleteNote(note.id);
    if(result !=0) {
    _showSnackBar(context, 'Word Deleted');
    updateListView();
  }}

  void _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message),);
    Scaffold.of(context).showSnackBar(snackBar);
  }
  
  void updateListView() async{//may be a problem
    DBHelper a;
    final Future<Database> dbFuture = a.initializeDatabase();
    dbFuture.then((database) { //may need to be databaseHelper
      Future<List<Note>> noteListFuture = a.getNoteList();
      noteListFuture.then((noteList){
      setState((){
        this.noteList = noteList;
        this.count = noteList.length;
      });
      });
    }
    );
  }
}
  