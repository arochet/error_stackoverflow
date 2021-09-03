import 'package:base_de_projet/domain/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistiques.freezed.dart';

@freezed
abstract class Statistiques with _$Statistiques {
  const Statistiques._();

  const factory Statistiques({
    required int nbGame,
    required int nbSuccess,
    required int nbDefeat,
  }) = _Statistiques;

  factory Statistiques.empty() =>
      Statistiques(nbDefeat: 0, nbGame: 0, nbSuccess: 0);

  Option<ValueFailure<dynamic>> get failureOption {
    return none();
  }

  int get score => nbSuccess * 5;
}