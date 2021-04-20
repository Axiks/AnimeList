import 'package:anime_list_app/models/anime.dart';
import 'package:equatable/equatable.dart';

abstract class AnimeState extends Equatable {
  const AnimeState();

  @override
  List<Object> get props => [];
}

class AnimeInitial extends AnimeState {}

class AnimeSuccess extends AnimeState {
  final List<Anime> anime;

  const AnimeSuccess({
    required this.anime,
  });

  AnimeSuccess copyWith({
    List<Anime>? anime
  }) {
    return AnimeSuccess(
      anime: anime ?? this.anime,
    );
  }

  @override
  List<Object> get props => [anime];
}

class AnimeStatus extends AnimeState {
  final bool status;

  const AnimeStatus({
    required this.status,
  });

  AnimeStatus copyWith({
    bool? status
  }) {
    return AnimeStatus(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}