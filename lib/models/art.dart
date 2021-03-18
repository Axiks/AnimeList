import 'anime.dart';

class Art{
  int index;
  Anime anime;

  Art(int index, Anime anime){
    this.anime = anime;
    this.index = index;
  }

  String getImgUrl(){
    return this.anime.arts[this.index];
  }
}