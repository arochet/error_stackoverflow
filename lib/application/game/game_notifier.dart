import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/domain/game/game_failure.dart';
import 'package:base_de_projet/domain/game/value_objects.dart';
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
    required bool? iWin,
    required UniqueId? idGame,
    required Option<Either<GameFailure, bool>> iAmBlackPlayerOrFailure,
    required Option<Either<GameFailure, Unit>> setWinnerOrFailure,
    required Option<Either<GameFailure, UniqueId>> idGameFailureOrSuccessOption,
  }) = _MyCurrentGameData;

  factory MyCurrentGameData.initial() => MyCurrentGameData(
        idGame: null,
        iAmFirstPlayer: null,
        iAmBlackPlayerOrFailure: none(),
        idAdversaire: '',
        iWin: null,
        idGameFailureOrSuccessOption: none(),
        setWinnerOrFailure: none(),
      );
}

class GameNotifier extends StateNotifier<MyCurrentGameData> {
  final GameRepository _gameRepository;

  GameNotifier(this._gameRepository) : super(MyCurrentGameData.initial());

  newGame(String idTable) async {
    Either<GameFailure, UniqueId> result =
        await this._gameRepository.newGame(idTable);
    result.fold((l) => null, (id) {
      state = state.copyWith(idGame: id);
    });
    state = state.copyWith(idGameFailureOrSuccessOption: optionOf(result));
  }

  reinit() {
    state = state.copyWith(
      idGameFailureOrSuccessOption: none(),
      iAmBlackPlayerOrFailure: none(),
      setWinnerOrFailure: none(),
    );
  }

  setBlackPlayer(bool iAmBlackPlayer) async {
    final idGame = state.idGame;
    if (idGame == null) {
      state = state.copyWith(
          iAmBlackPlayerOrFailure: some(left(GameFailure.serverError())));
    } else {
      reinit();
      final result =
          await this._gameRepository.setBlackPlayer(iAmBlackPlayer, idGame);
      state = state.copyWith(iAmBlackPlayerOrFailure: some(result));
    }
  }

  setWin(WinnerState win) async {
    if (state.idGame == null) {
      print("Error id game null");
      return;
    }
    reinit();
    final res = await this._gameRepository.enGame(state.idGame!, win);
    state = state.copyWith(setWinnerOrFailure: optionOf(res));
  }
}
