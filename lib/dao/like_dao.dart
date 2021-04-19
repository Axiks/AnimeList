import 'package:anime_list_app/database/database.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/favorite.dart';
import 'package:anime_list_app/models/user.dart';
import 'package:sqflite/sqlite_api.dart';

class LikeDao {
  final dbProvider = DBProvider();
  String _tableName = tableFavorite;

  //Adds new Like records
  Future<Favorite> addFavorite(Favorite favorite) async {
    Database db = await dbProvider.initializeDB();
    var id = await  db.insert(_tableName, favorite.toJson());
    Favorite f = favorite.copy(
      id: id
    );
    return f;
  }

  //Delete Like records
  Future<int> deleteFavorite(Favorite favorite) async {
    Database db = await dbProvider.initializeDB();
    var result = await db.delete(_tableName, where: '${FavoriteFiels.id} = ?', whereArgs: [favorite.id]);
    return result;
  }

  Future<bool> checkFavorite(Favorite favorite) async {
    List<String> columns = [FavoriteFiels.id, FavoriteFiels.userId, FavoriteFiels.animeId, FavoriteFiels.time];

    Database db = await dbProvider.initializeDB();
    List<Map> result = await db.query(_tableName,
        columns: columns,
        where: '${FavoriteFiels.animeId} = ? AND ${FavoriteFiels.userId} = ?',
        whereArgs: [favorite.anime.malId, favorite.user.id ]
    );

    if (result.length > 0) {
      return true;
    }
    return false;
  }


  //Get All Favorite items
  //Searches if query string was passed
  // Future<List<Favorite>> getFavorite({List<String> columns, String query}) async {
  //   final dbProvider = DBProvider();
  //   String _tableName = tableFavorite;
  //
  //   List<Map<String, dynamic>> result;
  //   if (query != null) {
  //     if (query.isNotEmpty)
  //       result = await db.query(todoTABLE,
  //           columns: columns,
  //           where: 'description LIKE ?',
  //           whereArgs: ["%$query%"]);
  //   } else {
  //     result = await db.query(todoTABLE, columns: columns);
  //   }
  //
  //   List<Todo> todos = result.isNotEmpty
  //       ? result.map((item) => Todo.fromDatabaseJson(item)).toList()
  //       : [];
  //   return todos;
  // }
  //
  // //Update Todo record
  // Future<int> updateFavorite(Todo todo) async {
  //   final db = await dbProvider.database;
  //
  //   var result = await db.update(todoTABLE, todo.toDatabaseJson(),
  //       where: "id = ?", whereArgs: [todo.id]);
  //
  //   return result;
  // }
  //
  // //Delete Todo records
  // Future<int> deleteFavorite(int id) async {
  //   final db = await dbProvider.database;
  //   var result = await db.delete(todoTABLE, where: 'id = ?', whereArgs: [id]);
  //
  //   return result;
  // }
  //
  // //We are not going to use this in the demo
  // Future deleteAllFavorites() async {
  //   final db = await dbProvider.database;
  //   var result = await db.delete(
  //     todoTABLE,
  //   );
  //
  //   return result;
  // }
}