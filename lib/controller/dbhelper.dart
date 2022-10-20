import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper{
  Database? database;
  static final intence = DBhelper._();
  DBhelper._(){

  }


  Future<Database?> checkdb()async{
    if(database!= null){
      return database;
    }
    else{
      return await creatdb();
    }
  }
  Future<Database> creatdb()async{
    Directory dir =await getApplicationDocumentsDirectory();
    String path = join(dir.path,"jensi.db");

    return openDatabase(path,version: 1,onCreate: (db,version){
      String query= "CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT,note TEXT)";
      db.execute(query);
    });
  }
  void insert(String note)async{
    database = await checkdb();
    database!.insert("todo", {"note":note},);
  }

  void update(String note,String id)async{
    database = await checkdb();
    database!.update("todo", {"note":note},where: "id = ?",whereArgs: [id]);
  }
  void delete(String id)async{
    database = await checkdb();
    database!.delete("todo",where: "id = ?",whereArgs: [id]);
  }
  Future<List<Map<String, Object?>>> readdata()async{
    database = await checkdb();
    String query = "SELECT * FROM todo";
    return database!.rawQuery(query);
  }
}