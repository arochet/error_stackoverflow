import 'package:base_de_projet/domain/core/failures.dart';
import 'package:base_de_projet/domain/game/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';

part 'game.freezed.dart';

@freezed
abstract class Game with _$Game {
  const Game._();

  const factory Game({
    required UniqueId id,
    required TableId idTable,
    required String idPlayerOne,
    required String idPlayerTwo,
    required BlackPlayer blackPlayer,
    required Winner winner,
    required VerificationWin verification,
  }) = _Game;

  factory Game.empty(String idTable, String idPlayerOne) => Game(
        id: UniqueId(),
        idTable: TableId(idTable),
        idPlayerOne: idPlayerOne,
        idPlayerTwo: "",
        blackPlayer: BlackPlayer(BlackPlayerState.notDefined),
        winner: Winner(WinnerState.inProgress),
        verification: VerificationWin(VerificationWinState.none),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return blackPlayer.failureOrUnit
        .andThen(winner.failureOrUnit)
        .fold((f) => some(f), (r) => none());
  }
}
