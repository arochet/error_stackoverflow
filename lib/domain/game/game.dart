import 'package:base_de_projet/domain/game/value_objects.dart';
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
  }) = _Game;

  factory Game.empty() => Game(
        id: UniqueId(),
        idTable: TableId(""),
        idPlayerOne: "",
        idPlayerTwo: "",
        blackPlayer: BlackPlayer(BlackPlayerState.notDefined),
        winner: Winner(WinnerState.inProgress),
      );
}
