import 'package:anime_list_app/models/anime.dart';
import 'package:equatable/equatable.dart';

abstract class AnimeEvent extends Equatable {
  const AnimeEvent();

  @override
  List<Object> get props => [];
}

class AnimeSearch extends AnimeEvent {
  final String name;

  const AnimeSearch(this.name);

  @override
  // TODO: implement props
  List<Object> get props => [name];
}

class AnimeGet extends AnimeEvent {
  final int id;

  const AnimeGet(this.id);

  @override
  // TODO: implement props
  List<Object> get props => [id];
}

class AnimeGetAll extends AnimeEvent {

  //const AnimeGet();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AnimeAdded extends AnimeEvent {
  final Anime anime;

  const AnimeAdded(this.anime);

  @override
  // TODO: implement props
  List<Object> get props => [anime];
}

class AnimeDeleted extends AnimeEvent {
  final Anime anime;

  const AnimeDeleted(this.anime);

  @override
  // TODO: implement props
  List<Object> get props => [anime];
}