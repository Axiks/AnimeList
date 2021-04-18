// import 'dart:io';
// import 'package:anime_list_app/models/favorite.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:async';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
//
// class DBProvider {
//   DBProvider._();
//
//   static final DBProvider db = DBProvider._();
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
//   initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, "anime_list_db.db");
//     return await openDatabase(path, version: 1,
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