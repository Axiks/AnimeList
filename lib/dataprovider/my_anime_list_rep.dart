import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/genres.dart';
import 'package:built_collection/src/list.dart';
import 'package:intl/intl.dart';
import 'package:jikan_api/jikan_api.dart' as japi;

class MyAnimeListRep{
  Future<List<Anime>> animeSearch(String q) async {
    var jikan = japi.Jikan();
    //Minimum 3 liter
    var search = await jikan.search(q, japi.SearchType.anime);
    List<Anime> animes = [];
    for(int i = 0; i<search.length; i++){
      var result = search[i];
      DateTime dtStart = DateTime.now();
      DateTime dtEnd = DateTime.now();
      if(dtStart==null){
        dtStart = DateFormat('yyyy-MM-ddTHH:mm:ss+').parse(result.startDate);
      }
      if(dtEnd==null){
        dtEnd = DateFormat('yyyy-MM-ddTHH:mm:ss+').parse(result.endDate);
      }

      //animeGetPictures(result.malId);
      List<String> art = [result.imageUrl];

      Anime anime = Anime(
        malId: result.malId,
        title: result.title,
        synopsis: result.synopsis,
        mainPicture: result.imageUrl,
        airing: false,
        episodes: result.episodes,
        mediaType: result.type,
        startDate: dtStart,
        endDate: dtEnd,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        arts: art,
      );
      animes.add(anime);
    }
    return animes;
  }

  Future<Anime> animeGet(int id) async {
    var jikan = japi.Jikan();
    var result = await jikan.getAnimeInfo(id);

    Map<String, List<String>> altTitles = {
      'eng': [result.titleEnglish],
      'jp': [result.titleJapanese]
    };
    DateTime dtStart = DateTime.utc(1900, 1, 1);
    DateTime dtEnd = DateTime.utc(1900, 1, 1);
    BuiltList<japi.GenericInfo> g =  result.genres;

    if(dtStart==null){
      dtStart = DateFormat('yyyy-MM-ddTHH:mm:ss+').parse(result.aired.from);
    }
    if(dtEnd==null){
      dtEnd = DateFormat('yyyy-MM-ddTHH:mm:ss+').parse(result.aired.to);
    }

    print("ANime Get Result"  + result.toString());
    print("ANime Genres Japi Result"  + result.genres.toString());

    List<Genres> animeGenresList = [];
    BuiltList<japi.GenericInfo> genresJapi = result.genres;
    for(int i = 0; i < genresJapi.length; i++){
      animeGenresList.add(_getTag(genresJapi[i].malId));
    }
    print("ANime Genres Local Result"  + animeGenresList.toString());

    Anime anime = Anime(
      malId: result.malId,
      title: result.title,
      alternativeTitles: altTitles,
      synopsis: result.synopsis,
      mainPicture: result.imageUrl,
      airing: result.airing,
      episodes: result.episodes,
      mediaType: result.type,
      startDate: dtStart,
      endDate: dtEnd,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      genres: animeGenresList,
    );
    print("ANime Result"  + anime.toString());
    print("ANime Result Ganres"  + anime.genres.toString());
    return anime;
  }

   animeGetPictures(int id) async {
    var jikan = japi.Jikan();
    BuiltList<japi.Picture> pictures = await jikan.getAnimePictures(id);
    print("Anime count pictures: " + pictures.length.toString());
    print(pictures.toString());
  }

  Genres _getTag(int id){
      switch (id) {
        case 1:
          return Genres.action;
        case 2:
          return Genres.adventure;
          break;
        case 3:
          return Genres.cars;
          break;
        case 4:
          return Genres.comedy;
          break;
        case 5:
          return Genres.dementia;
          break;
        case 6:
          return Genres.demons;
          break;
        case 8:
          return Genres.drama;
          break;
        case 9:
          return Genres.ecchi;
          break;
        case 10:
          return Genres.fantasy;
          break;
        case 11:
          return Genres.game;
          break;
        case 35:
          return Genres.harem;
          break;
        case 12:
          return Genres.hentai;
          break;
        case 13:
          return Genres.historical;
          break;
        case 14:
          return Genres.horror;
          break;
        case 43:
          return Genres.josei;
          break;
        case 15:
          return Genres.kids;
          break;
        case 16:
          return Genres.magic;
          break;
        case 17:
          return Genres.martialArts;
          break;
        case 18:
          return Genres.mecha;
          break;
        case 38:
          return Genres.military;
          break;
        case 19:
          return Genres.music;
          break;
        case 7:
          return Genres.mystery;
          break;
        case 20:
          return Genres.parody;
          break;
        case 39:
          return Genres.police;
          break;
        case 40:
          return Genres.psychological;
          break;
        case 22:
          return Genres.romance;
          break;
        case 21:
          return Genres.samurai;
          break;
        case 23:
          return Genres.school;
          break;
        case 24:
          return Genres.sciFi;
          break;
        case 43:
          return Genres.seinen;
          break;
        case 25:
          return Genres.shoujo;
          break;
        case 26:
          return Genres.shoujoAi;
          break;
        case 27:
          return Genres.hounen;
          break;
        case 28:
          return Genres.shounenAi;
          break;
        case 36:
          return Genres.sliceOfLife;
          break;
        case 29:
          return Genres.space;
          break;
        case 30:
          return Genres.sports;
          break;
        case 31:
          return Genres.superPower;
          break;
        case 37:
          return Genres.supernatural;
          break;
        case 41:
          return Genres.thriller;
          break;
        case 32:
          return Genres.vampire;
          break;
        case 33:
          return Genres.yaoi;
          break;
        case 34:
          return Genres.yuri;
          break;
        case 0:
          return Genres.none;
          break;
        default:
          return Genres.none;
          break;
      }
  }
}