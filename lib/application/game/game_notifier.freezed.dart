// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'game_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyCurrentGameDataTearOff {
  const _$MyCurrentGameDataTearOff();

  _MyCurrentGameData call(
      {required String idAdversaire,
      required bool? iAmFirstPlayer,
      required bool? iWin,
      required UniqueId? idGame,
      required Option<Either<GameFailure, bool>> iAmBlackPlayerOrFailure,
      required Option<Either<GameFailure, Unit>> setWinnerOrFailure,
      required Option<Either<GameFailure, UniqueId>>
          idGameFailureOrSuccessOption}) {
    return _MyCurrentGameData(
      idAdversaire: idAdversaire,
      iAmFirstPlayer: iAmFirstPlayer,
      iWin: iWin,
      idGame: idGame,
      iAmBlackPlayerOrFailure: iAmBlackPlayerOrFailure,
      setWinnerOrFailure: setWinnerOrFailure,
      idGameFailureOrSuccessOption: idGameFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $MyCurrentGameData = _$MyCurrentGameDataTearOff();

/// @nodoc
mixin _$MyCurrentGameData {
  String get idAdversaire => throw _privateConstructorUsedError;
  bool? get iAmFirstPlayer => throw _privateConstructorUsedError;
  bool? get iWin => throw _privateConstructorUsedError;
  UniqueId? get idGame => throw _privateConstructorUsedError;
  Option<Either<GameFailure, bool>> get iAmBlackPlayerOrFailure =>
      throw _privateConstructorUsedError;
  Option<Either<GameFailure, Unit>> get setWinnerOrFailure =>
      throw _privateConstructorUsedError;
  Option<Either<GameFailure, UniqueId>> get idGameFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyCurrentGameDataCopyWith<MyCurrentGameData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCurrentGameDataCopyWith<$Res> {
  factory $MyCurrentGameDataCopyWith(
          MyCurrentGameData value, $Res Function(MyCurrentGameData) then) =
      _$MyCurrentGameDataCopyWithImpl<$Res>;
  $Res call(
      {String idAdversaire,
      bool? iAmFirstPlayer,
      bool? iWin,
      UniqueId? idGame,
      Option<Either<GameFailure, bool>> iAmBlackPlayerOrFailure,
      Option<Either<GameFailure, Unit>> setWinnerOrFailure,
      Option<Either<GameFailure, UniqueId>> idGameFailureOrSuccessOption});
}

/// @nodoc
class _$MyCurrentGameDataCopyWithImpl<$Res>
    implements $MyCurrentGameDataCopyWith<$Res> {
  _$MyCurrentGameDataCopyWithImpl(this._value, this._then);

  final MyCurrentGameData _value;
  // ignore: unused_field
  final $Res Function(MyCurrentGameData) _then;

  @override
  $Res call({
    Object? idAdversaire = freezed,
    Object? iAmFirstPlayer = freezed,
    Object? iWin = freezed,
    Object? idGame = freezed,
    Object? iAmBlackPlayerOrFailure = freezed,
    Object? setWinnerOrFailure = freezed,
    Object? idGameFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      idAdversaire: idAdversaire == freezed
          ? _value.idAdversaire
          : idAdversaire // ignore: cast_nullable_to_non_nullable
              as String,
      iAmFirstPlayer: iAmFirstPlayer == freezed
          ? _value.iAmFirstPlayer
          : iAmFirstPlayer // ignore: cast_nullable_to_non_nullable
              as bool?,
      iWin: iWin == freezed
          ? _value.iWin
          : iWin // ignore: cast_nullable_to_non_nullable
              as bool?,
      idGame: idGame == freezed
          ? _value.idGame
          : idGame // ignore: cast_nullable_to_non_nullable
              as UniqueId?,
      iAmBlackPlayerOrFailure: iAmBlackPlayerOrFailure == freezed
          ? _value.iAmBlackPlayerOrFailure
          : iAmBlackPlayerOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<GameFailure, bool>>,
      setWinnerOrFailure: setWinnerOrFailure == freezed
          ? _value.setWinnerOrFailure
          : setWinnerOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<GameFailure, Unit>>,
      idGameFailureOrSuccessOption: idGameFailureOrSuccessOption == freezed
          ? _value.idGameFailureOrSuccessOption
          : idGameFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<GameFailure, UniqueId>>,
    ));
  }
}

/// @nodoc
abstract class _$MyCurrentGameDataCopyWith<$Res>
    implements $MyCurrentGameDataCopyWith<$Res> {
  factory _$MyCurrentGameDataCopyWith(
          _MyCurrentGameData value, $Res Function(_MyCurrentGameData) then) =
      __$MyCurrentGameDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String idAdversaire,
      bool? iAmFirstPlayer,
      bool? iWin,
      UniqueId? idGame,
      Option<Either<GameFailure, bool>> iAmBlackPlayerOrFailure,
      Option<Either<GameFailure, Unit>> setWinnerOrFailure,
      Option<Either<GameFailure, UniqueId>> idGameFailureOrSuccessOption});
}

/// @nodoc
class __$MyCurrentGameDataCopyWithImpl<$Res>
    extends _$MyCurrentGameDataCopyWithImpl<$Res>
    implements _$MyCurrentGameDataCopyWith<$Res> {
  __$MyCurrentGameDataCopyWithImpl(
      _MyCurrentGameData _value, $Res Function(_MyCurrentGameData) _then)
      : super(_value, (v) => _then(v as _MyCurrentGameData));

  @override
  _MyCurrentGameData get _value => super._value as _MyCurrentGameData;

  @override
  $Res call({
    Object? idAdversaire = freezed,
    Object? iAmFirstPlayer = freezed,
    Object? iWin = freezed,
    Object? idGame = freezed,
    Object? iAmBlackPlayerOrFailure = freezed,
    Object? setWinnerOrFailure = freezed,
    Object? idGameFailureOrSuccessOption = freezed,
  }) {
    return _then(_MyCurrentGameData(
      idAdversaire: idAdversaire == freezed
          ? _value.idAdversaire
          : idAdversaire // ignore: cast_nullable_to_non_nullable
              as String,
      iAmFirstPlayer: iAmFirstPlayer == freezed
          ? _value.iAmFirstPlayer
          : iAmFirstPlayer // ignore: cast_nullable_to_non_nullable
              as bool?,
      iWin: iWin == freezed
          ? _value.iWin
          : iWin // ignore: cast_nullable_to_non_nullable
              as bool?,
      idGame: idGame == freezed
          ? _value.idGame
          : idGame // ignore: cast_nullable_to_non_nullable
              as UniqueId?,
      iAmBlackPlayerOrFailure: iAmBlackPlayerOrFailure == freezed
          ? _value.iAmBlackPlayerOrFailure
          : iAmBlackPlayerOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<GameFailure, bool>>,
      setWinnerOrFailure: setWinnerOrFailure == freezed
          ? _value.setWinnerOrFailure
          : setWinnerOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<GameFailure, Unit>>,
      idGameFailureOrSuccessOption: idGameFailureOrSuccessOption == freezed
          ? _value.idGameFailureOrSuccessOption
          : idGameFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<GameFailure, UniqueId>>,
    ));
  }
}

/// @nodoc

class _$_MyCurrentGameData implements _MyCurrentGameData {
  const _$_MyCurrentGameData(
      {required this.idAdversaire,
      required this.iAmFirstPlayer,
      required this.iWin,
      required this.idGame,
      required this.iAmBlackPlayerOrFailure,
      required this.setWinnerOrFailure,
      required this.idGameFailureOrSuccessOption});

  @override
  final String idAdversaire;
  @override
  final bool? iAmFirstPlayer;
  @override
  final bool? iWin;
  @override
  final UniqueId? idGame;
  @override
  final Option<Either<GameFailure, bool>> iAmBlackPlayerOrFailure;
  @override
  final Option<Either<GameFailure, Unit>> setWinnerOrFailure;
  @override
  final Option<Either<GameFailure, UniqueId>> idGameFailureOrSuccessOption;

  @override
  String toString() {
    return 'MyCurrentGameData(idAdversaire: $idAdversaire, iAmFirstPlayer: $iAmFirstPlayer, iWin: $iWin, idGame: $idGame, iAmBlackPlayerOrFailure: $iAmBlackPlayerOrFailure, setWinnerOrFailure: $setWinnerOrFailure, idGameFailureOrSuccessOption: $idGameFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MyCurrentGameData &&
            (identical(other.idAdversaire, idAdversaire) ||
                const DeepCollectionEquality()
                    .equals(other.idAdversaire, idAdversaire)) &&
            (identical(other.iAmFirstPlayer, iAmFirstPlayer) ||
                const DeepCollectionEquality()
                    .equals(other.iAmFirstPlayer, iAmFirstPlayer)) &&
            (identical(other.iWin, iWin) ||
                const DeepCollectionEquality().equals(other.iWin, iWin)) &&
            (identical(other.idGame, idGame) ||
                const DeepCollectionEquality().equals(other.idGame, idGame)) &&
            (identical(
                    other.iAmBlackPlayerOrFailure, iAmBlackPlayerOrFailure) ||
                const DeepCollectionEquality().equals(
                    other.iAmBlackPlayerOrFailure, iAmBlackPlayerOrFailure)) &&
            (identical(other.setWinnerOrFailure, setWinnerOrFailure) ||
                const DeepCollectionEquality()
                    .equals(other.setWinnerOrFailure, setWinnerOrFailure)) &&
            (identical(other.idGameFailureOrSuccessOption,
                    idGameFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.idGameFailureOrSuccessOption,
                    idGameFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idAdversaire) ^
      const DeepCollectionEquality().hash(iAmFirstPlayer) ^
      const DeepCollectionEquality().hash(iWin) ^
      const DeepCollectionEquality().hash(idGame) ^
      const DeepCollectionEquality().hash(iAmBlackPlayerOrFailure) ^
      const DeepCollectionEquality().hash(setWinnerOrFailure) ^
      const DeepCollectionEquality().hash(idGameFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$MyCurrentGameDataCopyWith<_MyCurrentGameData> get copyWith =>
      __$MyCurrentGameDataCopyWithImpl<_MyCurrentGameData>(this, _$identity);
}

abstract class _MyCurrentGameData implements MyCurrentGameData {
  const factory _MyCurrentGameData(
      {required String idAdversaire,
      required bool? iAmFirstPlayer,
      required bool? iWin,
      required UniqueId? idGame,
      required Option<Either<GameFailure, bool>> iAmBlackPlayerOrFailure,
      required Option<Either<GameFailure, Unit>> setWinnerOrFailure,
      required Option<Either<GameFailure, UniqueId>>
          idGameFailureOrSuccessOption}) = _$_MyCurrentGameData;

  @override
  String get idAdversaire => throw _privateConstructorUsedError;
  @override
  bool? get iAmFirstPlayer => throw _privateConstructorUsedError;
  @override
  bool? get iWin => throw _privateConstructorUsedError;
  @override
  UniqueId? get idGame => throw _privateConstructorUsedError;
  @override
  Option<Either<GameFailure, bool>> get iAmBlackPlayerOrFailure =>
      throw _privateConstructorUsedError;
  @override
  Option<Either<GameFailure, Unit>> get setWinnerOrFailure =>
      throw _privateConstructorUsedError;
  @override
  Option<Either<GameFailure, UniqueId>> get idGameFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MyCurrentGameDataCopyWith<_MyCurrentGameData> get copyWith =>
      throw _privateConstructorUsedError;
}
