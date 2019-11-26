import 'package:flutter/material.dart';
///////////////////////////////////////////change NOteList to ManageWord
class NoteList extends StatefulWidget {

  @override
  _NoteListState createState() => _NoteListState();
 
  }
  

class _NoteListState extends State<NoteList> {
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Managae word"),
      ),
      body: getNoteListview(),
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
              child: Icon(Icons.access_alarm),
            ),
            title: Text("boboboboboobobob", style: titleStyle,),
            trailing: Icon(Icons.delete, color: Colors.black),
            onTap: () {
              debugPrint("ListTile Tapped");
            }
          ),
        );
      }
    );
  }
}
  