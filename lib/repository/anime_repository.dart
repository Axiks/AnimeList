import 'package:anime_list_app/dao/anime_dao.dart';
import 'package:anime_list_app/dataprovider/my_anime_list_rep.dart';
import 'package:anime_list_app/models/anime.dart';

class AnimeRepository{
  Future<List<Anime>> animeSearch(String q) async {
    List<Anime> animes = await MyAnimeListRep().animeSearch(q);
    //AddToLocalDB
    // for(int i=0; i<animes.length; i++){
    //   if(await _checkAnimeLocalDB(animes[i].malId) == false){
    //     print("Add to DB Anime id: " + animes[i].malId.toString());
    //     bool res = await _addAnimeLocalDB(animes[i]);
    //     //print(res.toString());
    //   }
    // }
    //animeGet(animes[0].malId);
    return animes;
  }

  Future<Anime> animeGet(int id) async {
    //return MyAnimeListRep().animeGet(id);
    // if(_checkAnimeLocalDB(id) == false){
    // }
    Anime animes = await MyAnimeListRep().animeGet(id);
    if(await _checkAnimeLocalDB(id) == false){
          print("Add to DB Anime id: " + id.toString());
          bool res = await _addAnimeLocalDB(animes);
          //print(res.toString());
        }
    return animes;
  }

  Future<bool> _checkAnimeLocalDB(int animeId) async {
    bool check = false;
    List<Anime> anime = await AnimeDao().getAnime(animeId);
    if(anime.length != 0){
      check = true;
    }
    return check;
  }

  Future<bool> _addAnimeLocalDB(Anime anime) async {
    bool check = false;
    check = await AnimeDao().addAnime(anime);
    return check;
  }
}