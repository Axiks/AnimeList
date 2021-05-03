import 'package:equatable/equatable.dart';

class AlternativeTitleFiels{
  static final String id = "_id";
  static final String animeId = "anime_id";
  static final String userId = "user_id";
  static final String lang = "lang";
  static final String body = "body";
  static final String createdAt = "createdAt";
}

class AlternativeTitle extends Equatable{
  final int? id;
  final int animeId;
  final int userId;
  final String lang;
  final String body;
  final DateTime? createdAt;

  const AlternativeTitle({
    this.id,
    required this.animeId,
    required this.userId,
    required this.lang,
    required this.body,
    this.createdAt,
  });

  List<Object?> get props => [
    id,
    animeId,
    userId,
    lang,
    body,
    createdAt,
  ];

  Map<String, Object> toJson() => {};

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