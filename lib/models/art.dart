import 'package:equatable/equatable.dart';

import 'anime.dart';

final String tableArt = 'art';

class ArtFiels{
  static final String id = "_id";
  static final String animeId = "anime_id";
  static final String href = "href";
}

class Art extends Equatable{
  final int? index;
  final String href;
  final Anime anime;

  const Art({
    this.index,
    required this.href,
    required this.anime,
});

  // String getImgUrl(){
  //   return this.anime.arts[this.index];
  // }

  @override
  List<Object?> get props => [
    index,
    href,
    anime
  ];

  Art copy({
    int? index,
    String? href,
    Anime? anime,
  }) => Art(
    index: index ?? this.index,
    href: href ?? this.href,
    anime: anime ?? this.anime,
  );
}