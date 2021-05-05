import 'package:equatable/equatable.dart';

final String tableTags = 'tags';

class TagFiels{
  static final String id = "_id";
  static final String nameEng = "name_eng";
  static final String nameUa = "name_ua";
}

class Tag extends Equatable{
  final int id;
  final String nameEng;
  final String nameUa;

  const Tag({
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

  Tag copy({
    int? id,
    String? nameEng,
    String? nameUa,
  }) => Tag(
    id: id ?? this.id,
    nameEng: nameEng ?? this.nameEng,
    nameUa: nameUa ?? this.nameUa,
  );

}