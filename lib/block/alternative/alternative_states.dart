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

class AlternativeGeted extends AlternativeState {
  final List<AlternativeTitle> alternativeTitle;

  const AlternativeGeted({
    required this.alternativeTitle,
  });

  AlternativeGeted copyWith({
    List<AlternativeTitle>? alternativeTitle
  }) {
    return AlternativeGeted(
      alternativeTitle: alternativeTitle ?? this.alternativeTitle,
    );
  }

  @override
  List<Object> get props => [alternativeTitle];
}

class AlternativeDeleted extends AlternativeState {
  final bool success;

  const AlternativeDeleted({
    required this.success,
  });

  AlternativeDeleted copyWith({
    bool? success
  }) {
    return AlternativeDeleted(
      success: success ?? this.success,
    );
  }

  @override
  List<Object> get props => [success];
}

