import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:yofy/object/note.dart';

class DBHelper{

  static DBHelper _dbHelper;
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colEWord = 'eWord';
  String colHWord = 'hWord';

  factory DBHelper(){

    if (DBHelper == null){
      _dbHelper = DBHelper.createInstance();
    }
    return _dbHelper;
  }

  Future<Database> get database async{

    if (_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  DBHelper.createInstance();

  Future<Database> initializeDatabase() async{

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';
    var noteDatabase = await openDatabase(path, version: 1, onCreate: _createDB);
    return noteDatabase;

  }

  _createDB(Database db, int newVersion) async{

    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colEWord TEXT,'' $colHWord TEXT)');
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async{
    Database db = await this.database;

    var result = await db.rawQuery('SELECT * FROM $noteTable order by $colId ASC');
    //can also be writen this way
    // var result = await db.query(noteTable, orderBy: '$colId ASC');
     
     return result;
  }

  insertNote(Note note) async{
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  updateNote (Note note) async{
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id] );
    return result;
    }

  deleteNote(int id) async{
    Database db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  getCount() async{
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
  Future<List<Note>> getNoteList() async{
    var noteMapList = await getNoteMapList();
    List<Note> noteList = List<Note>();
    for(int a=0; a<noteMapList.length; a++){
      noteList[a] = new Note(noteMapList[a]["id"], noteMapList[a]["eWord"],noteMapList[a]["hWord"]);//may be  problme
    } 
    return noteList;
  }

}
 



