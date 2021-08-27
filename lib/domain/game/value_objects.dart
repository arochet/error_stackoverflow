import 'package:base_de_projet/domain/game/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_de_projet/domain/core/failures.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';

enum WinnerState { inProgress, playerOneWin, playerTwoWin, draw }
enum BlackPlayerState { playerOne, playerTwo, notDefined }

extension ParseToSringBP on BlackPlayerState {
  String toShortString() {
    return this.toString().toLowerCase();
  }
}

extension ParseToSringW on WinnerState {
  String toShortString() {
    return this.toString().toLowerCase();
  }
}

@immutable
class Winner extends ValueObject<WinnerState> {
  @override
  final Either<ValueFailure<WinnerState>, WinnerState> value;

  factory Winner(WinnerState input) {
    return Winner._(right(input));
  }

  const Winner._(this.value);
}

@immutable
class BlackPlayer extends ValueObject<BlackPlayerState> {

  @override
  final Either<ValueFailure<BlackPlayerState>, BlackPlayerState> value;

  factory BlackPlayer(BlackPlayerState input) {
    return BlackPlayer._(right(input));
  }
  
  factory BlackPlayer.fromString(String input) {
    final BlackPlayerState state = BlackPlayerState.values.firstWhere((e) => e.toString() == input);
    //On est là ......
    if(state == null) return left(valueF)
    return BlackPlayer._(right(input));
  }

  const BlackPlayer._(this.value);
}

@immutable
class TableId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TableId(String input) {
    return TableId._(validateTableId(input));
  }

  const TableId._(this.value);
}
