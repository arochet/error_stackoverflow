// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GameTearOff {
  const _$GameTearOff();

  _Game call(
      {required UniqueId id,
      required TableId idTable,
      required String idPlayerOne,
      required String idPlayerTwo,
      required BlackPlayer blackPlayer,
      required Winner winner,
      required VerificationWin verification}) {
    return _Game(
      id: id,
      idTable: idTable,
      idPlayerOne: idPlayerOne,
      idPlayerTwo: idPlayerTwo,
      blackPlayer: blackPlayer,
      winner: winner,
      verification: verification,
    );
  }
}

/// @nodoc
const $Game = _$GameTearOff();

/// @nodoc
mixin _$Game {
  UniqueId get id => throw _privateConstructorUsedError;
  TableId get idTable => throw _privateConstructorUsedError;
  String get idPlayerOne => throw _privateConstructorUsedError;
  String get idPlayerTwo => throw _privateConstructorUsedError;
  BlackPlayer get blackPlayer => throw _privateConstructorUsedError;
  Winner get winner => throw _privateConstructorUsedError;
  VerificationWin get verification => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      TableId idTable,
      String idPlayerOne,
      String idPlayerTwo,
      BlackPlayer blackPlayer,
      Winner winner,
      VerificationWin verification});
}

/// @nodoc
class _$GameCopyWithImpl<$Res> implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  final Game _value;
  // ignore: unused_field
  final $Res Function(Game) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? idTable = freezed,
    Object? idPlayerOne = freezed,
    Object? idPlayerTwo = freezed,
    Object? blackPlayer = freezed,
    Object? winner = freezed,
    Object? verification = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      idTable: idTable == freezed
          ? _value.idTable
          : idTable // ignore: cast_nullable_to_non_nullable
              as TableId,
      idPlayerOne: idPlayerOne == freezed
          ? _value.idPlayerOne
          : idPlayerOne // ignore: cast_nullable_to_non_nullable
              as String,
      idPlayerTwo: idPlayerTwo == freezed
          ? _value.idPlayerTwo
          : idPlayerTwo // ignore: cast_nullable_to_non_nullable
              as String,
      blackPlayer: blackPlayer == freezed
          ? _value.blackPlayer
          : blackPlayer // ignore: cast_nullable_to_non_nullable
              as BlackPlayer,
      winner: winner == freezed
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as Winner,
      verification: verification == freezed
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as VerificationWin,
    ));
  }
}

/// @nodoc
abstract class _$GameCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$GameCopyWith(_Game value, $Res Function(_Game) then) =
      __$GameCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      TableId idTable,
      String idPlayerOne,
      String idPlayerTwo,
      BlackPlayer blackPlayer,
      Winner winner,
      VerificationWin verification});
}

/// @nodoc
class __$GameCopyWithImpl<$Res> extends _$GameCopyWithImpl<$Res>
    implements _$GameCopyWith<$Res> {
  __$GameCopyWithImpl(_Game _value, $Res Function(_Game) _then)
      : super(_value, (v) => _then(v as _Game));

  @override
  _Game get _value => super._value as _Game;

  @override
  $Res call({
    Object? id = freezed,
    Object? idTable = freezed,
    Object? idPlayerOne = freezed,
    Object? idPlayerTwo = freezed,
    Object? blackPlayer = freezed,
    Object? winner = freezed,
    Object? verification = freezed,
  }) {
    return _then(_Game(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      idTable: idTable == freezed
          ? _value.idTable
          : idTable // ignore: cast_nullable_to_non_nullable
              as TableId,
      idPlayerOne: idPlayerOne == freezed
          ? _value.idPlayerOne
          : idPlayerOne // ignore: cast_nullable_to_non_nullable
              as String,
      idPlayerTwo: idPlayerTwo == freezed
          ? _value.idPlayerTwo
          : idPlayerTwo // ignore: cast_nullable_to_non_nullable
              as String,
      blackPlayer: blackPlayer == freezed
          ? _value.blackPlayer
          : blackPlayer // ignore: cast_nullable_to_non_nullable
              as BlackPlayer,
      winner: winner == freezed
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as Winner,
      verification: verification == freezed
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as VerificationWin,
    ));
  }
}

/// @nodoc

class _$_Game extends _Game {
  const _$_Game(
      {required this.id,
      required this.idTable,
      required this.idPlayerOne,
      required this.idPlayerTwo,
      required this.blackPlayer,
      required this.winner,
      required this.verification})
      : super._();

  @override
  final UniqueId id;
  @override
  final TableId idTable;
  @override
  final String idPlayerOne;
  @override
  final String idPlayerTwo;
  @override
  final BlackPlayer blackPlayer;
  @override
  final Winner winner;
  @override
  final VerificationWin verification;

  @override
  String toString() {
    return 'Game(id: $id, idTable: $idTable, idPlayerOne: $idPlayerOne, idPlayerTwo: $idPlayerTwo, blackPlayer: $blackPlayer, winner: $winner, verification: $verification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Game &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.idTable, idTable) ||
                const DeepCollectionEquality()
                    .equals(other.idTable, idTable)) &&
            (identical(other.idPlayerOne, idPlayerOne) ||
                const DeepCollectionEquality()
                    .equals(other.idPlayerOne, idPlayerOne)) &&
            (identical(other.idPlayerTwo, idPlayerTwo) ||
                const DeepCollectionEquality()
                    .equals(other.idPlayerTwo, idPlayerTwo)) &&
            (identical(other.blackPlayer, blackPlayer) ||
                const DeepCollectionEquality()
                    .equals(other.blackPlayer, blackPlayer)) &&
            (identical(other.winner, winner) ||
                const DeepCollectionEquality().equals(other.winner, winner)) &&
            (identical(other.verification, verification) ||
                const DeepCollectionEquality()
                    .equals(other.verification, verification)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(idTable) ^
      const DeepCollectionEquality().hash(idPlayerOne) ^
      const DeepCollectionEquality().hash(idPlayerTwo) ^
      const DeepCollectionEquality().hash(blackPlayer) ^
      const DeepCollectionEquality().hash(winner) ^
      const DeepCollectionEquality().hash(verification);

  @JsonKey(ignore: true)
  @override
  _$GameCopyWith<_Game> get copyWith =>
      __$GameCopyWithImpl<_Game>(this, _$identity);
}

abstract class _Game extends Game {
  const factory _Game(
      {required UniqueId id,
      required TableId idTable,
      required String idPlayerOne,
      required String idPlayerTwo,
      required BlackPlayer blackPlayer,
      required Winner winner,
      required VerificationWin verification}) = _$_Game;
  const _Game._() : super._();

  @override
  UniqueId get id => throw _privateConstructorUsedError;
  @override
  TableId get idTable => throw _privateConstructorUsedError;
  @override
  String get idPlayerOne => throw _privateConstructorUsedError;
  @override
  String get idPlayerTwo => throw _privateConstructorUsedError;
  @override
  BlackPlayer get blackPlayer => throw _privateConstructorUsedError;
  @override
  Winner get winner => throw _privateConstructorUsedError;
  @override
  VerificationWin get verification => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GameCopyWith<_Game> get copyWith => throw _privateConstructorUsedError;
}
