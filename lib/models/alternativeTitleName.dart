import 'package:equatable/equatable.dart';

final String tableAlternativeTitleName = 'alternative_title_name';

class AlternativeTitleFiels{
  static final String id = "_id";
  static final String animeId = "anime_id";
  static final String lang = "lang";
  static final String body = "body";
}

class AlternativeTitle extends Equatable{
  final int id;
  final int animeId;
  final String lang;
  final String body;

  const AlternativeTitle({
    required  this.id,
    required  this.animeId,
    required  this.lang,
    required  this.body,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    animeId,
    lang,
    body
  ];

  AlternativeTitle copy({
    int? id,
    int? animeId,
    String? lang,
    String? body,
}) => AlternativeTitle(
    id: id ?? this.id,
    animeId: animeId ?? this.animeId,
    lang: lang ?? this.lang,
    body: body ?? this.body,
  );

}