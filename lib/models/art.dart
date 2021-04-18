import 'package:equatable/equatable.dart';

import 'anime.dart';

class Art extends Equatable{
  final int index;
  final Anime anime;

  // Art(int index, Anime anime){
  //   this.anime = anime;
  //   this.index = index;
  // }

  const Art({
    required this.index,
    required this.anime,
});

  String getImgUrl(){
    return this.anime.arts[this.index];
  }

  @override
  List<Object?> get props => [
    index,
    anime
  ];
}