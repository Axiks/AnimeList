import 'anime.dart';

class User {
  String name;
  String mainPicture;
  String coverPicture;
  List<Anime> favoriteAnime = [];

  User(String name, String mainPicture, String coverPicture){
    this.name = name;
    this.mainPicture = mainPicture;
    this.coverPicture = coverPicture;
  }

  setFavoriteAnimeList(List<Anime> favoriteAnime){
    this.favoriteAnime = favoriteAnime;
  }
}
