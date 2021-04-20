import 'package:equatable/equatable.dart';

final String tableAnimeDubs = 'anime_dubs';

class AnimeDubsFiels{
  static final String id = "_id";
  static final String animeId = "anime_id";
  static final String dubId = "dub_id";
}

class AnimeDubs extends Equatable{
  final int id;
  final int animeId;
  final int dubId;

  const AnimeDubs({
    required this.id,
    required this.animeId,
    required this.dubId
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    animeId,
    dubId
  ];

  AnimeDubs copy({
    int? id,
    int? animeId,
    int? dubId,
  }) => AnimeDubs(
    id: id ?? this.id,
    animeId: animeId ?? this.animeId,
    dubId: dubId ?? this.dubId,
  );

}