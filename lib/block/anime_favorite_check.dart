import 'package:anime_list_app/dao/like_dao.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/data.dart';
import 'package:anime_list_app/models/favorite.dart';
import 'package:anime_list_app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite_event.dart';

class AnimeFavoriteCheck extends Bloc<FavoriteEvent, bool> {
  AnimeFavoriteCheck(bool initialState) : super(false);

  @override
  Stream<bool> mapEventToState(FavoriteEvent event) async* {
    print("Start, mapEventToState: " + event.toString());

    if (event is FavoriteGet) {
      yield* _mapFavoritesGetToState(event);
    } else if (event is FavoriteAdded) {
      yield* _mapFavoriteAddedToState(event);
    } else if (event is FavoriteDeleted) {
      yield* _mapFavoriteDeletedToState(event);
    }else{
      print("Else");
    }
  }

  Stream<bool>  _mapFavoritesGetToState(FavoriteGet event) async* {
    Anime anime_comparison = event.anime;
    User neko = event.user;
    //List<Anime> favoriteAnimeList = neko.favoriteAnime;
    // print("Anime, id: " + anime_comparison.malId.toString());
    // bool btnStatus = false;
    // for(int i=0; i < favoriteAnimeList.length; i++){
    //   print("Anime check id: " + favoriteAnimeList[i].malId.toString());
    //   if(anime_comparison.malId.compareTo(favoriteAnimeList[i].malId) == 0){
    //     print("true");
    //     btnStatus = true;
    //     break;
    //   }
    // }
    // yield btnStatus;

    print("Anime, id: " + anime_comparison.malId.toString());
    Favorite favorite = Favorite(
      anime: anime_comparison,
      user: neko,
    );
    bool btnStatus = false;
    btnStatus = await LikeDao().checkFavorite(favorite);
    yield btnStatus;
  }

  Stream<bool>  _mapFavoriteAddedToState(FavoriteAdded event) async* {
    Anime anime_comparison = event.anime;
    User neko = event.user;
    print("Anime, id: " + anime_comparison.malId.toString());
    Favorite favorite = Favorite(
      anime: anime_comparison,
      user: neko,
    );
    bool btnStatus = false;
    Favorite f = await LikeDao().addFavorite(favorite);
    if (f.id != 0){
      btnStatus = true;
    }
    yield btnStatus;
  }

  Stream<bool>  _mapFavoriteDeletedToState(FavoriteDeleted event) async* {
    Anime anime_comparison = event.anime;
    User neko = event.user;
    List<Anime> favoriteAnimeList = neko.favoriteAnime;
    print("Anime, id: " + anime_comparison.malId.toString());
    bool btnStatus = false;
    for(int i=0; i < favoriteAnimeList.length; i++){
      print("Anime check id: " + favoriteAnimeList[i].malId.toString());
      if(anime_comparison.malId.compareTo(favoriteAnimeList[i].malId) == 0){
        print("true");
        btnStatus = true;
        break;
      }
    }
    yield btnStatus;
  }

}