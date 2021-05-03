import 'package:anime_list_app/models/connectors/alternative/alternativeTitle.dart';
import 'package:equatable/equatable.dart';

final String tableAlternativeTitleDescription = 'alternative_title_description';

// class AlternativeDescriptionFields{
//   static final String id = "_id";
//   static final String animeId = "anime_id";
//   static final String userId = "user_id";
//   static final String lang = "lang";
//   static final String body = "body";
//   static final String createdAt = "createdAt";
// }

class AlternativeDescription extends AlternativeTitle{
  AlternativeDescription({
    id,
    animeId,
    userId,
    lang,
    body,
    createdAt
  }): super(
    id: id,
    animeId: animeId,
    userId: userId,
    lang: lang,
    body: body,
    createdAt: createdAt,
  );

  Map<String, Object> toJson() => {
    AlternativeTitleFiels.id : id!,
    AlternativeTitleFiels.animeId: animeId,
    AlternativeTitleFiels.userId: userId,
    AlternativeTitleFiels.lang: lang,
    AlternativeTitleFiels.body: body,
    AlternativeTitleFiels.createdAt: createdAt!.toIso8601String(),
  };

  factory AlternativeDescription.fromDatabaseJson(Map<String, dynamic> data) => AlternativeDescription(
    id: data[AlternativeTitleFiels.id],
    animeId: data[AlternativeTitleFiels.animeId],
    userId: data[AlternativeTitleFiels.userId],
    lang: data[AlternativeTitleFiels.lang],
    body: data[AlternativeTitleFiels.body],
    createdAt: DateTime.parse(data[AlternativeTitleFiels.createdAt]),
  );

}