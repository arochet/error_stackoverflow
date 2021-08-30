// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'statistiques.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatistiquesTearOff {
  const _$StatistiquesTearOff();

  _Statistiques call(
      {required int nbGame, required int nbSuccess, required int nbDefeat}) {
    return _Statistiques(
      nbGame: nbGame,
      nbSuccess: nbSuccess,
      nbDefeat: nbDefeat,
    );
  }
}

/// @nodoc
const $Statistiques = _$StatistiquesTearOff();

/// @nodoc
mixin _$Statistiques {
  int get nbGame => throw _privateConstructorUsedError;
  int get nbSuccess => throw _privateConstructorUsedError;
  int get nbDefeat => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatistiquesCopyWith<Statistiques> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatistiquesCopyWith<$Res> {
  factory $StatistiquesCopyWith(
          Statistiques value, $Res Function(Statistiques) then) =
      _$StatistiquesCopyWithImpl<$Res>;
  $Res call({int nbGame, int nbSuccess, int nbDefeat});
}

/// @nodoc
class _$StatistiquesCopyWithImpl<$Res> implements $StatistiquesCopyWith<$Res> {
  _$StatistiquesCopyWithImpl(this._value, this._then);

  final Statistiques _value;
  // ignore: unused_field
  final $Res Function(Statistiques) _then;

  @override
  $Res call({
    Object? nbGame = freezed,
    Object? nbSuccess = freezed,
    Object? nbDefeat = freezed,
  }) {
    return _then(_value.copyWith(
      nbGame: nbGame == freezed
          ? _value.nbGame
          : nbGame // ignore: cast_nullable_to_non_nullable
              as int,
      nbSuccess: nbSuccess == freezed
          ? _value.nbSuccess
          : nbSuccess // ignore: cast_nullable_to_non_nullable
              as int,
      nbDefeat: nbDefeat == freezed
          ? _value.nbDefeat
          : nbDefeat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$StatistiquesCopyWith<$Res>
    implements $StatistiquesCopyWith<$Res> {
  factory _$StatistiquesCopyWith(
          _Statistiques value, $Res Function(_Statistiques) then) =
      __$StatistiquesCopyWithImpl<$Res>;
  @override
  $Res call({int nbGame, int nbSuccess, int nbDefeat});
}

/// @nodoc
class __$StatistiquesCopyWithImpl<$Res> extends _$StatistiquesCopyWithImpl<$Res>
    implements _$StatistiquesCopyWith<$Res> {
  __$StatistiquesCopyWithImpl(
      _Statistiques _value, $Res Function(_Statistiques) _then)
      : super(_value, (v) => _then(v as _Statistiques));

  @override
  _Statistiques get _value => super._value as _Statistiques;

  @override
  $Res call({
    Object? nbGame = freezed,
    Object? nbSuccess = freezed,
    Object? nbDefeat = freezed,
  }) {
    return _then(_Statistiques(
      nbGame: nbGame == freezed
          ? _value.nbGame
          : nbGame // ignore: cast_nullable_to_non_nullable
              as int,
      nbSuccess: nbSuccess == freezed
          ? _value.nbSuccess
          : nbSuccess // ignore: cast_nullable_to_non_nullable
              as int,
      nbDefeat: nbDefeat == freezed
          ? _value.nbDefeat
          : nbDefeat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Statistiques extends _Statistiques {
  const _$_Statistiques(
      {required this.nbGame, required this.nbSuccess, required this.nbDefeat})
      : super._();

  @override
  final int nbGame;
  @override
  final int nbSuccess;
  @override
  final int nbDefeat;

  @override
  String toString() {
    return 'Statistiques(nbGame: $nbGame, nbSuccess: $nbSuccess, nbDefeat: $nbDefeat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Statistiques &&
            (identical(other.nbGame, nbGame) ||
                const DeepCollectionEquality().equals(other.nbGame, nbGame)) &&
            (identical(other.nbSuccess, nbSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.nbSuccess, nbSuccess)) &&
            (identical(other.nbDefeat, nbDefeat) ||
                const DeepCollectionEquality()
                    .equals(other.nbDefeat, nbDefeat)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nbGame) ^
      const DeepCollectionEquality().hash(nbSuccess) ^
      const DeepCollectionEquality().hash(nbDefeat);

  @JsonKey(ignore: true)
  @override
  _$StatistiquesCopyWith<_Statistiques> get copyWith =>
      __$StatistiquesCopyWithImpl<_Statistiques>(this, _$identity);
}

abstract class _Statistiques extends Statistiques {
  const factory _Statistiques(
      {required int nbGame,
      required int nbSuccess,
      required int nbDefeat}) = _$_Statistiques;
  const _Statistiques._() : super._();

  @override
  int get nbGame => throw _privateConstructorUsedError;
  @override
  int get nbSuccess => throw _privateConstructorUsedError;
  @override
  int get nbDefeat => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatistiquesCopyWith<_Statistiques> get copyWith =>
      throw _privateConstructorUsedError;
}
