import 'package:equatable/equatable.dart';

import 'anime.dart';

class User extends Equatable{
  final int id;
  final String name;
  final String mainPicture;
  final String coverPicture;
  final List<Anime> favoriteAnime;

  // User(String name, String mainPicture, String coverPicture){
  //   this.name = name;
  //   this.mainPicture = mainPicture;
  //   this.coverPicture = coverPicture;
  // }

  const User({
    required this.id,
    required this.name,
    required this.mainPicture,
    required this.coverPicture,
    required this.favoriteAnime
});

  // setFavoriteAnimeList(List<Anime> favoriteAnime){
  //   this.favoriteAnime = favoriteAnime;
  // }

  List<Object?> get props => [
    id,
    name,
    mainPicture,
    coverPicture,
    favoriteAnime
  ];

  User copy({
    int? id,
    String? name,
    String? mainPicture,
    String? coverPicture,
    List<Anime>? favoriteAnime

  }) => User(
      id: id ?? this.id,
      name: name ?? this.name,
      mainPicture: mainPicture ?? this.mainPicture,
      coverPicture: coverPicture ?? this.coverPicture,
      favoriteAnime: favoriteAnime ?? this.favoriteAnime
  );
}
