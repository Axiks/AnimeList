import 'package:equatable/equatable.dart';
import 'dub.dart';

final String tableAnime = 'anime';

class AnimeFiels{
  static final String malId = "_malId";
  static final String title = "title";
  static final String mainPicture = "mainPicture";
  static final String startDate = "startDate";
  static final String endDate = "endDate";
  static final String synopsis = "synopsis";
  static final String createdAt = "createdAt";
  static final String updatedAt = "updatedAt";
  static final String mediaType = "mediaType";
  static final String status = "status";
}


class Anime extends Equatable{
  final int malId;
  final String title;
  final Map alternativeTitles;
  final String mainPicture;
  final DateTime startDate;
  final DateTime endDate;
  final String synopsis;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String mediaType;
  final String status;
  final List<String> genres;
  final List<Dub> dubs;
  final List<String> arts;

  const Anime({
    required  this.malId,
    required this.title,
    required this.alternativeTitles,
    required this.mainPicture,
    required this.startDate,
    required this.endDate,
    required this.synopsis,
    required this.createdAt,
    required this.updatedAt,
    required this.mediaType,
    required this.status,
    required this.genres,
    required this.dubs,
    required this.arts
});

  @override
  List<Object?> get props => [
    malId,
    title,
    alternativeTitles,
    mainPicture,
    startDate,
    endDate,
    synopsis,
    createdAt,
    updatedAt,
    mediaType,
    status,
    genres,
    dubs,
    arts
  ];

  Anime copy({
    int? malId,
    String? title,
    Map? alternativeTitles,
    String? mainPicture,
    DateTime? startDate,
    DateTime? endDate,
    String? synopsis,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? mediaType,
    String? status,
    List<String>? genres,
    List<Dub>? dubs,
    List<String>? arts,
}) => Anime(
      malId: malId ?? this.malId,
      title: title ?? this.title,
      alternativeTitles: alternativeTitles ?? this.alternativeTitles,
      mainPicture: mainPicture ?? this.mainPicture,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      synopsis: synopsis ?? this.synopsis,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      mediaType: mediaType ?? this.mediaType,
      status: status ?? this.status,
      genres: genres ?? this.genres,
      dubs: dubs ?? this.dubs,
      arts: arts ?? this.arts
  );
}
