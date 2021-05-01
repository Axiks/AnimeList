import 'package:equatable/equatable.dart';

final String tableAlternativeTitleDescription = 'alternative_title_description';

class AlternativeDescriptionFields{
  static final String id = "_id";
  static final String animeId = "anime_id";
  static final String userId = "user_id";
  static final String lang = "lang";
  static final String body = "body";
  static final String createdAt = "createdAt";
}

class AlternativeDescription extends Equatable{
  final int id;
  final int animeId;
  final int userId;
  final String lang;
  final String body;
  final DateTime createdAt;

  const AlternativeDescription({
    required this.id,
    required this.animeId,
    required this.userId,
    required this.lang,
    required this.body,
    required this.createdAt,
  });

  Map<String, Object> toJson() => {
    AlternativeDescriptionFields.id : id,
    AlternativeDescriptionFields.animeId: animeId,
    AlternativeDescriptionFields.userId: userId,
    AlternativeDescriptionFields.lang: lang,
    AlternativeDescriptionFields.body: body,
    AlternativeDescriptionFields.createdAt: createdAt.toIso8601String(),
  };

  factory AlternativeDescription.fromDatabaseJson(Map<String, dynamic> data) => AlternativeDescription(
    id: data[AlternativeDescriptionFields.id],
    animeId: data[AlternativeDescriptionFields.animeId],
    userId: data[AlternativeDescriptionFields.userId],
    lang: data[AlternativeDescriptionFields.lang],
    body: data[AlternativeDescriptionFields.body],
    createdAt: DateTime.parse(data[AlternativeDescriptionFields.createdAt]),
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    animeId,
    userId,
    lang,
    body,
    createdAt,
  ];

  AlternativeDescription copy({
    int? id,
    int? animeId,
    int? userId,
    String? lang,
    String? body,
    DateTime? createdAt
}) => AlternativeDescription(
    id: id ?? this.id,
    animeId: animeId ?? this.animeId,
    userId: userId ?? this.userId,
    lang: lang ?? this.lang,
    body: body ?? this.body,
    createdAt: createdAt ?? this.createdAt,
  );

}