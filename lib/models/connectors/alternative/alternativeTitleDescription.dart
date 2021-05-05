import 'package:anime_list_app/models/connectors/alternative/alternativeTitle.dart';
import 'package:equatable/equatable.dart';

final String tableAlternativeTitleDescription = 'alternative_title_description';

class AlternativeDescription extends AlternativeTitle{
  AlternativeDescription({
    int? id,
    required int animeId,
    int? userId,
    required String lang,
    required String body,
    required String source,
    required bool primary,
    DateTime? createdAt
  }): super(
    id: id,
    animeId: animeId,
    userId: userId,
    lang: lang,
    body: body,
    source: source,
    primary: primary,
    createdAt: createdAt,
  );

  factory AlternativeDescription.fromDatabaseJson(Map<String, dynamic> data) => AlternativeDescription(
    id: data[AlternativeTitleFiels.id],
    animeId: data[AlternativeTitleFiels.animeId],
    userId: int.tryParse(data[AlternativeTitleFiels.userId]) ?? 0,
    lang: data[AlternativeTitleFiels.lang],
    body: data[AlternativeTitleFiels.body],
    source: data[AlternativeTitleFiels.source],
    primary: data[AlternativeTitleFiels.primary],
    createdAt: DateTime.parse(data[AlternativeTitleFiels.createdAt]),
  );
}