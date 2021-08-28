import 'package:base_de_projet/domain/auth/server_failure.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/domain/game/game_failure.dart';
import 'package:base_de_projet/infrastructure/game/game_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'game_notifier.freezed.dart';

@freezed
class MyCurrentGameData with _$MyCurrentGameData {
  const factory MyCurrentGameData({
    required String idAdversaire,
    required bool? iAmFirstPlayer,
    required bool? iAmBlackPlayer,
    required bool? iWin,
    required Option<Either<GameFailure, UniqueId>> idGameFailureOrSuccessOption,
  }) = _MyCurrentGameData;

  factory MyCurrentGameData.initial() => MyCurrentGameData(
        iAmFirstPlayer: null,
        iAmBlackPlayer: null,
        idAdversaire: '',
        iWin: null,
        idGameFailureOrSuccessOption: none(),
      );
}

class GameNotifier extends StateNotifier<MyCurrentGameData> {
  final GameRepository _gameRepository;

  GameNotifier(this._gameRepository) : super(MyCurrentGameData.initial());

  newGame(String idTable) async {
    Either<GameFailure, UniqueId> result =
        await this._gameRepository.newGame(idTable);
    state = state.copyWith(idGameFailureOrSuccessOption: optionOf(result));
  }

  reinit() {
    state = state.copyWith(idGameFailureOrSuccessOption: none());
  }

  setBlackPlayer(bool iAmBlackPlayer) {}

  setWin(bool iWin) {}
}
