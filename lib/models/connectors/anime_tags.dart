import 'package:equatable/equatable.dart';

final String tableAnimeTags= 'anime_tags';

class AnimeTagsFiels{
  static final String id = "_id";
  static final String animeId = "anime_id";
  static final String tagId = "tag_id";
}

class AnimeTags extends Equatable{
  final int id;
  final int animeId;
  final int tagId;

  const AnimeTags({
    required this.id,
    required this.animeId,
    required this.tagId
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    animeId,
    tagId
  ];

  AnimeTags copy({
    int? id,
    int? animeId,
    int? tagId,
  }) => AnimeTags(
    id: id ?? this.id,
    animeId: animeId ?? this.animeId,
    tagId: tagId ?? this.tagId,
  );

}