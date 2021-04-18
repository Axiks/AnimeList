import 'package:anime_list_app/models/data.dart';
import 'package:anime_list_app/models/user.dart';

import 'anime.dart';

final String tableFavorite = 'favorite';

class FavoriteFiels{
  static final String id = "_id";
  static final String userId = "user_id";
  static final String animeId = "anime_id";
  static final String time = "anime_id";
}

class Favorite {
  final int id;
  final Anime anime;
  final User user;
  final DateTime createdTime;

  const Favorite({
    required this.id,
    required this.anime,
    required this.user,
    required this.createdTime
});

  @override
  // TODO: implement props
  List<Object> get props => [anime, user];

  Map<String, Object> toJson() => {
    FavoriteFiels.id: id,
    FavoriteFiels.userId: user.id,
    FavoriteFiels.animeId: anime.malId,
    FavoriteFiels.time: createdTime.toIso8601String(),
  };

  Favorite copy({
    int? id,
    Anime? anime,
    User? user,
    DateTime? createdTime

}) => Favorite(
    id: id ?? this.id,
    anime: anime ?? this.anime,
    user: user ?? this.user,
    createdTime: createdTime ?? this.createdTime,
  );
}