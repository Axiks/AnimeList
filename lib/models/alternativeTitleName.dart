import 'package:equatable/equatable.dart';

final String tableAlternativeTitleName = 'alternative_title_name';

class AlternativeTitleFiels{
  static final String id = "_id";
  static final String animeId = "anime_id";
  static final String userId = "user_id";
  static final String lang = "lang";
  static final String body = "body";
  static final String createdAt = "createdAt";
}

class AlternativeTitle extends Equatable{
  final int id;
  final int animeId;
  final int userId;
  final String lang;
  final String body;
  final DateTime createdAt;

  const AlternativeTitle({
    required this.id,
    required this.animeId,
    required this.userId,
    required this.lang,
    required this.body,
    required this.createdAt,
  });

  Map<String, Object> toJson() => {
    AlternativeTitleFiels.id : id,
    AlternativeTitleFiels.animeId: animeId,
    AlternativeTitleFiels.userId: userId,
    AlternativeTitleFiels.lang: lang,
    AlternativeTitleFiels.body: body,
    AlternativeTitleFiels.createdAt: createdAt.toIso8601String(),
  };

  factory AlternativeTitle.fromDatabaseJson(Map<String, dynamic> data) => AlternativeTitle(
    id: data[AlternativeTitleFiels.id],
    animeId: data[AlternativeTitleFiels.animeId],
    userId: data[AlternativeTitleFiels.userId],
    lang: data[AlternativeTitleFiels.lang],
    body: data[AlternativeTitleFiels.body],
    createdAt: DateTime.parse(data[AlternativeTitleFiels.createdAt]),
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

  AlternativeTitle copy({
    int? id,
    int? animeId,
    int? userId,
    String? lang,
    String? body,
    DateTime? createdAt
}) => AlternativeTitle(
    id: id ?? this.id,
    animeId: animeId ?? this.animeId,
    userId: userId ?? this.userId,
    lang: lang ?? this.lang,
    body: body ?? this.body,
    createdAt: createdAt ?? this.createdAt,
  );

}