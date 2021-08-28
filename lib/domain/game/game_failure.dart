import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_failure.freezed.dart';

@freezed
abstract class GameFailure with _$GameFailure {
  const factory GameFailure.serverError() = ServerError;
  const factory GameFailure.userAlreadyCreatedGame() = UserAlreadyCreatedGame;
  const factory GameFailure.noInternet() = NoInternet;
}
