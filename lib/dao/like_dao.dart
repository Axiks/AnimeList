// import 'package:anime_list_app/database/database.dart';
// import 'package:anime_list_app/models/anime.dart';
// import 'package:anime_list_app/models/favorite.dart';
// import 'package:anime_list_app/models/user.dart';
//
// class LikeDao {
//   final dbProvider = DBProvider.db;
//   String _tableName = 'FavoriteUserAnime';
//
//   //Adds new Like records
//   Future<int> createFavorite(Favorite favorite) async {
//     final db = await dbProvider.database;
//     var id = db.insert(_tableName, favorite.toJson());
//     Favorite f = favorite;
//     f.id = id;
//     return favorite.copy(id: id);
//   }
//
//   //Get All Todo items
//   //Searches if query string was passed
//   Future<List<Todo>> getFavorite({List<String> columns, String query}) async {
//     final db = await dbProvider.database;
//
//     List<Map<String, dynamic>> result;
//     if (query != null) {
//       if (query.isNotEmpty)
//         result = await db.query(todoTABLE,
//             columns: columns,
//             where: 'description LIKE ?',
//             whereArgs: ["%$query%"]);
//     } else {
//       result = await db.query(todoTABLE, columns: columns);
//     }
//
//     List<Todo> todos = result.isNotEmpty
//         ? result.map((item) => Todo.fromDatabaseJson(item)).toList()
//         : [];
//     return todos;
//   }
//
//   //Update Todo record
//   Future<int> updateFavorite(Todo todo) async {
//     final db = await dbProvider.database;
//
//     var result = await db.update(todoTABLE, todo.toDatabaseJson(),
//         where: "id = ?", whereArgs: [todo.id]);
//
//     return result;
//   }
//
//   //Delete Todo records
//   Future<int> deleteFavorite(int id) async {
//     final db = await dbProvider.database;
//     var result = await db.delete(todoTABLE, where: 'id = ?', whereArgs: [id]);
//
//     return result;
//   }
//
//   //We are not going to use this in the demo
//   Future deleteAllFavorites() async {
//     final db = await dbProvider.database;
//     var result = await db.delete(
//       todoTABLE,
//     );
//
//     return result;
//   }
// }