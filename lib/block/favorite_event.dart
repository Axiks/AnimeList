import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/favorite.dart';
import 'package:anime_list_app/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteGet extends FavoriteEvent {
  final Anime anime;
  final User user;

  const FavoriteGet(this.anime, this.user);

  @override
  // TODO: implement props
  List<Object> get props => [anime, user];
}

class FavoriteAdded extends FavoriteEvent {
  final Anime anime;
  final User user;

  const FavoriteAdded(this.anime, this.user);

  @override
  // TODO: implement props
  List<Object> get props => [anime, user];
  // final Favorite favorite;
  //
  // const FavoriteAdded(this.favorite);
  //
  // @override
  // List<Object> get props => [favorite];
  //
  // @override
  // String toString() => 'TFavoriteAdded { todo: $favorite }';
}

class FavoriteDeleted extends FavoriteEvent {
  final Anime anime;
  final User user;

  const FavoriteDeleted(this.anime, this.user);

  @override
  // TODO: implement props
  List<Object> get props => [anime, user];
  // final Favorite favorite;
  //
  // const FavoriteDeleted(this.favorite);
  //
  // @override
  // List<Object> get props => [favorite];
  //
  // @override
  // String toString() => 'FavoriteDeleted { todo: $favorite }';
}