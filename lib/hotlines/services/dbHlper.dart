import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/sqliteModel.dart';

class DbHelper{
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;

  DbHelper.internal();
   Database? _db;

  Future<Database> createDatabase() async{
    if(_db != null){
      return _db!;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'favorite.db');
    _db = await openDatabase(path,version: 1, onCreate: (Database db, int v){
      //create tables
      db.execute('create table favItems(id integer primary key autoincrement, itemid integer, name varchar(50), content varchar(255) , url varchar(255) ,image varchar(255), phone varchar(255) , website varchar(255) ,facebook varchar(255))');
    });
    return _db!;
  }
  Future<int> createfavItem(FavItem favItem) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses value')
    return db.insert('favItems', favItem.toMap());
  }

  Future<List> allfavItem() async{
    Database db = await createDatabase();
    //db.rawQuery('select * from courses');
    return db.query('favItems');
  }

  Future<int> delete(String name) async{
    Database db = await createDatabase();
    return db.delete('favItems', where: 'name = ?', whereArgs: [name]);
  }
  Future<int> updatefavItem(FavItem favItem) async{
    Database db = await createDatabase();
    return await db.update('favItems', favItem.toMap(),where: 'id = ?', whereArgs: [favItem.itemid]);
  }
}