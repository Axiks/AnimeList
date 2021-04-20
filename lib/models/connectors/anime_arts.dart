import 'package:equatable/equatable.dart';

final String tableAnimeArts = 'anime_arts';

class AnimeArtsFiels{
  static final String id = "_id";
  static final String animeId = "anime_id";
  static final String artId = "art_id";
}

class AnimeArts extends Equatable{
  final int id;
  final int animeId;
  final int artId;

  const AnimeArts({
    required this.id,
    required this.animeId,
    required this.artId
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    animeId,
    artId
  ];

  AnimeArts copy({
    int? id,
    int? animeId,
    int? artId,
  }) => AnimeArts(
    id: id ?? this.id,
    animeId: animeId ?? this.animeId,
    artId: artId ?? this.artId,
  );

}