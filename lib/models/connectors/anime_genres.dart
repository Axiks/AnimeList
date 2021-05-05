import 'package:equatable/equatable.dart';

final String tableAnimeGenres = 'anime_genres';

class AnimeGenresFiels{
  static final String id = "_id";
  static final String animeId = "anime_id";
  static final String genresId = "genres_id";
}

class AnimeGenres extends Equatable{
  final int id;
  final int animeId;
  final int genresId;

  const AnimeGenres({
    required this.id,
    required this.animeId,
    required this.genresId
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    animeId,
    genresId
  ];

  AnimeGenres copy({
    int? id,
    int? animeId,
    int? genresId,
  }) => AnimeGenres(
    id: id ?? this.id,
    animeId: animeId ?? this.animeId,
    genresId: genresId ?? this.genresId,
  );

}