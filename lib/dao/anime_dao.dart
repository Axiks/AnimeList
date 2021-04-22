import 'package:anime_list_app/database/database.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:sqflite/sqflite.dart';

class AnimeDao{
  final dbProvider = DBProvider();
  String _tableName = tableAnime;

  //Get Anime records
  Future<List<Anime>> getAnime(int id) async {
    List<String> columns = [
      AnimeFiels.malId,
      AnimeFiels.title,
      AnimeFiels.mainPicture,
      AnimeFiels.startDate,
      AnimeFiels.endDate,
      AnimeFiels.synopsis,
      AnimeFiels.createdAt,
      AnimeFiels.updatedAt,
      AnimeFiels.mediaType,
      AnimeFiels.status
    ];

    Database db = await dbProvider.initializeDB();
    List<Map<String, dynamic>> result = await db.query(_tableName,
        columns: columns,
        where: '${AnimeFiels.malId} = ?',
        whereArgs: [id]
    );

    print("Get anime  result: " + result.toString());
    print("Lenght anime  result: " + result.length.toString());

    List<Anime> animes = result.isNotEmpty
        ? result.map((item) => Anime.fromDatabaseJson(item)).toList()
        : [];
    //return animes.first;
    return animes;
  }

  //Get All Anime records
  Future<List<Anime>> getAllAnime() async {
    List<String> columns = [
      AnimeFiels.malId,
      AnimeFiels.title,
      AnimeFiels.mainPicture,
      AnimeFiels.startDate,
      AnimeFiels.endDate,
      AnimeFiels.synopsis,
      AnimeFiels.createdAt,
      AnimeFiels.updatedAt,
      AnimeFiels.mediaType,
      AnimeFiels.status
    ];

    Database db = await dbProvider.initializeDB();
    List<Map<String, dynamic>> result = await db.query(_tableName,
        columns: columns
    );

    List<Anime> animes = result.isNotEmpty
        ? result.map((item) => Anime.fromDatabaseJson(item)).toList()
        : [];
    return animes;
  }

  //Adds new Anime records
  Future<bool> addAnime(Anime anime) async {
    Database db = await dbProvider.initializeDB();
    print(anime.toJson());
    int id = await db.insert(_tableName, anime.toJson());
    bool status = false;
    if (id > 0){
      status = true;
    }
    return status;
  }

  //Delete Anime records
  Future<bool> deleteAnime(Anime anime) async {
    Database db = await dbProvider.initializeDB();
    int result = await db.delete(_tableName, where: '${AnimeFiels.malId} = ?', whereArgs: [anime.malId]);
    bool status = false;
    if (result > 0){
      status = true;
    }
    return status;
  }
}