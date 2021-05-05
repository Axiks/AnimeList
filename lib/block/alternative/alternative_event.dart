import 'package:anime_list_app/models/connectors/alternative/alternativeTitle.dart';
import 'package:equatable/equatable.dart';

abstract class AlternativeEvent extends Equatable {
  const AlternativeEvent();

  @override
  List<Object> get props => [];
}

class AlternativeAdd extends AlternativeEvent {
  final AlternativeTitle alternativeTitle;

  const AlternativeAdd(this.alternativeTitle);

  @override
  // TODO: implement props
  List<Object> get props => [alternativeTitle];
}

class AlternativeGetName extends AlternativeEvent {
  final int animeId;

  const AlternativeGetName(this.animeId);

  @override
  // TODO: implement props
  List<Object> get props => [animeId];
}

class AlternativeGetDescription extends AlternativeEvent {
  final int animeId;

  const AlternativeGetDescription(this.animeId);

  @override
  // TODO: implement props
  List<Object> get props => [animeId];
}

class AlternativeDelete extends AlternativeEvent {
  final AlternativeTitle alternativeTitle;

  const AlternativeDelete(this.alternativeTitle);

  @override
  // TODO: implement props
  List<Object> get props => [alternativeTitle];
}