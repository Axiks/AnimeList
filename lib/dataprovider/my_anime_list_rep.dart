import 'package:anime_list_app/models/anime.dart';
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

      Anime anime = Anime(
        malId: result.malId,
        title: result.title,
        synopsis: result.synopsis,
        mainPicture: result.imageUrl,
        status: "none",
        mediaType: result.type,
        startDate: dtStart,
        endDate: dtEnd,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      animes.add(anime);
    }
    return animes;
  }

  Future<Anime> animeGet(int id) async {
    var jikan = japi.Jikan();
    var result = await jikan.getAnimeInfo(id);

    Anime anime = Anime(
      malId: result.malId,
      title: result.title,
      synopsis: result.synopsis,
      mainPicture: result.imageUrl,
      status: result.status,
      mediaType: result.type,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    return anime;
  }

   animeGetPictures(int id) async {
    var jikan = japi.Jikan();
    BuiltList<japi.Picture> pictures = await jikan.getAnimePictures(id);
    print("Anime count: " + pictures.length.toString());
    print(pictures.toString());
  }

}