import 'package:anime_list_app/models/anime.dart';
import 'package:equatable/equatable.dart';

abstract class AnimeState extends Equatable {
  const AnimeState();

  @override
  List<Object> get props => [];
}

class AnimeInitial extends AnimeState {}

class AnimeSuccess extends AnimeState {
  const AnimeSuccess();

  @override
  List<Object> get props => [];
}

class AnimeSuccessTrue extends AnimeSuccess {
  final List<Anime> anime;

  const AnimeSuccessTrue({
    required this.anime,
  });

  AnimeSuccess copyWith({
    List<Anime>? anime
  }) {
    return AnimeSuccessTrue(
      anime: anime ?? this.anime,
    );
  }

  @override
  List<Object> get props => [anime];
}

class AnimeSuccessFalse extends AnimeSuccess {}

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