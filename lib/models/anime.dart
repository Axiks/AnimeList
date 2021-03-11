import 'dub.dart';

class Anime {
  int malId;
  String title;
  Map alternativeTitles;
  String mainPicture;
  DateTime startDate;
  DateTime endDate;
  String synopsis;
  DateTime createdAt;
  DateTime updatedAt;
  String mediaType;
  String status;
  List<String> genres = [];
  List<Dub> dubs = [];
  List<String> arts = [];//Delete
}
