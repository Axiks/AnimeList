import 'package:equatable/equatable.dart';

class AlternativeTitleFiels{
  static final String id = "_id";
  static final String animeId = "anime_id";
  static final String userId = "user_id";
  static final String lang = "lang";
  static final String body = "body";
  static final String source = "source";
  static final String primary = "master";
  static final String createdAt = "created_at";
}

class AlternativeTitle extends Equatable{
  final int? id;
  final int animeId;
  final int? userId;
  final String lang;
  final String body;
  final String source;
  final bool primary;
  final DateTime? createdAt;

  const AlternativeTitle({
    this.id,
    required this.animeId,
    this.userId,
    required this.lang,
    required this.body,
    required this.source,
    required this.primary,
    this.createdAt,
  });

  List<Object?> get props => [
    id,
    animeId,
    userId,
    lang,
    body,
    source,
    primary,
    createdAt,
  ];

  Map<String, Object> toJson() => {
    AlternativeTitleFiels.animeId: animeId,
    AlternativeTitleFiels.userId: userId ?? "",
    AlternativeTitleFiels.lang: lang,
    AlternativeTitleFiels.body: body,
    AlternativeTitleFiels.source: source,
    AlternativeTitleFiels.primary: primary ? 1 : 0,
    AlternativeTitleFiels.createdAt: DateTime.now().toIso8601String(),
  };

  AlternativeTitle copy({
    int? id,
    int? animeId,
    int? userId,
    String? lang,
    String? body,
    String? source,
    bool? primary,
    DateTime? createdAt
  }) => AlternativeTitle(
    id: id ?? this.id,
    animeId: animeId ?? this.animeId,
    userId: userId ?? this.userId,
    lang: lang ?? this.lang,
    body: body ?? this.body,
    source: source ?? this.source,
    primary: primary ?? this.primary,
    createdAt: createdAt ?? this.createdAt,
  );

}