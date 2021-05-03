import 'package:anime_list_app/models/connectors/alternative/alternativeTitle.dart';
import 'package:equatable/equatable.dart';

abstract class AlternativeState extends Equatable {
  const AlternativeState();

  @override
  List<Object> get props => [];
}

class AlternativeInitial extends AlternativeState {}

class AlternativeAdded extends AlternativeState {
  final bool success;

  const AlternativeAdded({
    required this.success,
  });

  AlternativeAdded copyWith({
    bool? success
  }) {
    return AlternativeAdded(
      success: success ?? this.success,
    );
  }

  @override
  List<Object> get props => [success];
}

class AlternativeGet extends AlternativeState {
  final AlternativeTitle alternativeTitle;

  const AlternativeGet({
    required this.alternativeTitle,
  });

  AlternativeGet copyWith({
    bool? success
  }) {
    return AlternativeGet(
      alternativeTitle: alternativeTitle ?? this.alternativeTitle,
    );
  }

  @override
  List<Object> get props => [alternativeTitle];
}

class AlternativeDelete extends AlternativeState {
  final bool success;

  const AlternativeDelete({
    required this.success,
  });

  AlternativeDelete copyWith({
    bool? success
  }) {
    return AlternativeDelete(
      success: success ?? this.success,
    );
  }

  @override
  List<Object> get props => [success];
}

