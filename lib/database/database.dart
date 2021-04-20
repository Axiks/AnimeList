import 'dart:io';
import 'package:anime_list_app/models/alternativeTitleName.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/art.dart';
import 'package:anime_list_app/models/connectors/anime_arts.dart';
import 'package:anime_list_app/models/connectors/anime_dubs.dart';
import 'package:anime_list_app/models/connectors/anime_genres.dart';
import 'package:anime_list_app/models/connectors/anime_tags.dart';
import 'package:anime_list_app/models/dubs.dart';
import 'package:anime_list_app/models/favorite.dart';
import 'package:anime_list_app/models/genres.dart';
import 'package:anime_list_app/models/tag.dart';
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
          //Favorite
          await db.execute("CREATE TABLE $tableFavorite ("
              "${FavoriteFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${FavoriteFiels.userId} INTEGER NOT NULL,"
              "${FavoriteFiels.animeId} INTEGER NOT NULL,"
              "${FavoriteFiels.time} TEXT NOT NULL"
              ")");

          //Anime
          await db.execute("CREATE TABLE $tableAnime ("
              "${AnimeFiels.malId} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${AnimeFiels.title} TEXT NOT NULL,"
              "${AnimeFiels.mainPicture} TEXT NOT NULL,"
              "${AnimeFiels.startDate} TEXT NOT NULL,"
              "${AnimeFiels.endDate} TEXT,"
              "${AnimeFiels.synopsis} TEXT NOT NULL,"
              "${AnimeFiels.createdAt} TEXT NOT NULL,"
              "${AnimeFiels.updatedAt} TEXT NOT NULL,"
              "${AnimeFiels.mediaType} TEXT NOT NULL,"
              "${AnimeFiels.status} TEXT NOT NULL"
              ")");


          //Art
          await db.execute("CREATE TABLE $tableArt ("
              "${ArtFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${ArtFiels.animeId} INTEGER NOT NULL,"
              "${ArtFiels.href} TEXT NOT NULL"
              ")");

          //Alternative Title Name
          await db.execute("CREATE TABLE $tableAlternativeTitleName ("
              "${AlternativeTitleFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${AlternativeTitleFiels.animeId} INTEGER NOT NULL,"
              "${AlternativeTitleFiels.lang} TEXT NOT NULL,"
              "${AlternativeTitleFiels.body} TEXT NOT NULL"
              ")");

          //Dubs
          await db.execute("CREATE TABLE $tableDubFiels ("
              "${DubFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${DubFiels.siteName} TEXT NOT NULL,"
              "${DubFiels.href} TEXT NOT NULL,"
              "${DubFiels.turnedOutSeriesCount} INTEGER NOT NULL"
              ")");

          //Genres
          await db.execute("CREATE TABLE $tableGenres ("
              "${GenresFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${GenresFiels.nameEng} TEXT NOT NULL,"
              "${GenresFiels.nameUa} TEXT NOT NULL"
              ")");

          //Tags
          await db.execute("CREATE TABLE $tableTags ("
              "${TagFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${TagFiels.nameEng} TEXT NOT NULL,"
              "${TagFiels.nameUa} TEXT NOT NULL"
              ")");

          //Anime_Arts
          await db.execute("CREATE TABLE $tableAnimeArts ("
              "${AnimeArtsFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${AnimeArtsFiels.animeId} INTEGER NOT NULL,"
              "${AnimeArtsFiels.artId} INTEGER NOT NULL"
              ")");

          //Anime_Dubs
          await db.execute("CREATE TABLE $tableAnimeDubs ("
              "${AnimeDubsFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${AnimeDubsFiels.animeId} INTEGER NOT NULL,"
              "${AnimeDubsFiels.dubId} INTEGER NOT NULL"
              ")");

          //Anime_Genres
          await db.execute("CREATE TABLE $tableAnimeGenres ("
              "${AnimeGenresFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${AnimeGenresFiels.animeId} INTEGER NOT NULL,"
              "${AnimeGenresFiels.genresId} INTEGER NOT NULL"
              ")");

          //Anime_Genres
          await db.execute("CREATE TABLE $tableAnimeTags ("
              "${AnimeTagsFiels.id} INTEGER PRIMARY KEY AUTOINCREMENT ,"
              "${AnimeTagsFiels.animeId} INTEGER NOT NULL,"
              "${AnimeTagsFiels.tagId} INTEGER NOT NULL"
              ")");
        });
  }
}