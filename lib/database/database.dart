import 'dart:io';
import 'package:anime_list_app/models/favorite.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider {
  static final _databasename = "anime_list.db";
  static final _databaseersion = 1;
  //var  db = await initializeDB();

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return await openDatabase(
      join(path, _databasename),
      version: _databaseersion,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE $tableFavorite ("
              "${FavoriteFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${FavoriteFiels.userId} INTEGER NOT NULL,"
              "${FavoriteFiels.animeId} INTEGER NOT NULL,"
              "${FavoriteFiels.time} TEXT NOT NULL"
              ")");
        });
  }
}

// class DBProvider {
//   static final _databasename = "anime_list.db";
//   static final _databaseersion = 1;
//
//   static Database _database;
//
//   Future<Database> get database async {
//     if (_database != null)
//       return _database;
//
//     // if _database is null we instantiate it
//     _database = await initDB();
//     return _database;
//   }
//
//
//   initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, _databasename);
//     return await openDatabase(path, version: _databaseersion,
//         onOpen: (db) {},
//         onCreate: (Database db, int version) async {
//           await db.execute("CREATE TABLE $tableFavorite ("
//               "${FavoriteFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
//               "${FavoriteFiels.userId} INTEGER NOT NULL,"
//               "${FavoriteFiels.animeId} INTEGER NOT NULL,"
//               "${FavoriteFiels.time} TEXT NOT NULL"
//               ")");
//         });
//   }
// }