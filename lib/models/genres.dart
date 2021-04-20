import 'package:equatable/equatable.dart';

final String tableGenres = 'genres';

class GenresFiels{
  static final String id = "_id";
  static final String nameEng = "name_eng";
  static final String nameUa = "name_ua";
}

class Genres extends Equatable{
  final int id;
  final String nameEng;
  final String nameUa;

  const Genres({
    required this.id,
    required this.nameEng,
    required this.nameUa
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    nameEng,
    nameUa
  ];

  Genres copy({
    int? id,
    String? nameEng,
    String? nameUa,
  }) => Genres(
    id: id ?? this.id,
    nameEng: nameEng ?? this.nameEng,
    nameUa: nameUa ?? this.nameUa,
  );

}