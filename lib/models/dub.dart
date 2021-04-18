import 'package:equatable/equatable.dart';

class Dub extends Equatable{
  final int dubId;
  final String  siteName;
  final String href;
  final int allSeriesCount;
  final int turnedOutSeriesCount;

  const Dub({
    required this.dubId,
    required this.siteName,
    required this. href,
    required this.allSeriesCount,
    required this.turnedOutSeriesCount
});

  @override
  List<Object?> get props => [
    dubId,
    siteName,
    href,
    allSeriesCount,
    turnedOutSeriesCount
  ];
}