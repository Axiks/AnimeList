import 'package:equatable/equatable.dart';

final String tableDubFiels = 'dubs';

class DubFiels{
  static final String id = "_id";
  static final String siteName = "site_name";
  static final String href = "href";
  static final String turnedOutSeriesCount = "turned_out_series_count";
}

class Dub extends Equatable{
  final int id;
  final String siteName;
  final String href;
  final int turnedOutSeriesCount;

  const Dub({
    required this.id,
    required this.siteName,
    required this.href,
    required this.turnedOutSeriesCount,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    siteName,
    href,
    turnedOutSeriesCount
  ];

  Dub copy({
    int? id,
    String? siteName,
    String? href,
    int? turnedOutSeriesCount,
  }) => Dub(
    id: id ?? this.id,
    siteName: siteName ?? this.siteName,
    href: href ?? this.href,
    turnedOutSeriesCount: turnedOutSeriesCount ?? this.turnedOutSeriesCount,
  );

}