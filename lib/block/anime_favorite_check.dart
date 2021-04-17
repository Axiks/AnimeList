import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/data.dart';
import 'package:anime_list_app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyEvent{
  final Anime anime;
  final User user;

  const MyEvent(this.anime, this.user);

  @override
  // TODO: implement props
  List<Object> get props => [anime, user];
}


class AnimeFavoriteCheck extends Bloc<MyEvent, bool> {
  AnimeFavoriteCheck(bool initialState) : super(true);

  @override
  Stream<bool> mapEventToState(MyEvent event) async* {
    print("Start, mapEventToState: " + event.toString());
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