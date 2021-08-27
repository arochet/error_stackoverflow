// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'game_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameDTO _$GameDTOFromJson(Map<String, dynamic> json) {
  return _GameDTO.fromJson(json);
}

/// @nodoc
class _$GameDTOTearOff {
  const _$GameDTOTearOff();

  _GameDTO call(
      {@JsonKey(ignore: true) String? id,
      required String idTable,
      required String idPlayerOne,
      required String idPlayerTwo,
      required String blackPlayer,
      @ServerTimestampConverter() required FieldValue timestampCreation,
      required String winner}) {
    return _GameDTO(
      id: id,
      idTable: idTable,
      idPlayerOne: idPlayerOne,
      idPlayerTwo: idPlayerTwo,
      blackPlayer: blackPlayer,
      timestampCreation: timestampCreation,
      winner: winner,
    );
  }

  GameDTO fromJson(Map<String, Object> json) {
    return GameDTO.fromJson(json);
  }
}

/// @nodoc
const $GameDTO = _$GameDTOTearOff();

/// @nodoc
mixin _$GameDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get idTable => throw _privateConstructorUsedError;
  String get idPlayerOne => throw _privateConstructorUsedError;
  String get idPlayerTwo => throw _privateConstructorUsedError;
  String get blackPlayer => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  FieldValue get timestampCreation => throw _privateConstructorUsedError;
  String get winner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameDTOCopyWith<GameDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDTOCopyWith<$Res> {
  factory $GameDTOCopyWith(GameDTO value, $Res Function(GameDTO) then) =
      _$GameDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String idTable,
      String idPlayerOne,
      String idPlayerTwo,
      String blackPlayer,
      @ServerTimestampConverter() FieldValue timestampCreation,
      String winner});
}

/// @nodoc
class _$GameDTOCopyWithImpl<$Res> implements $GameDTOCopyWith<$Res> {
  _$GameDTOCopyWithImpl(this._value, this._then);

  final GameDTO _value;
  // ignore: unused_field
  final $Res Function(GameDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? idTable = freezed,
    Object? idPlayerOne = freezed,
    Object? idPlayerTwo = freezed,
    Object? blackPlayer = freezed,
    Object? timestampCreation = freezed,
    Object? winner = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idTable: idTable == freezed
          ? _value.idTable
          : idTable // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      timestampCreation: timestampCreation == freezed
          ? _value.timestampCreation
          : timestampCreation // ignore: cast_nullable_to_non_nullable
              as FieldValue,
      winner: winner == freezed
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GameDTOCopyWith<$Res> implements $GameDTOCopyWith<$Res> {
  factory _$GameDTOCopyWith(_GameDTO value, $Res Function(_GameDTO) then) =
      __$GameDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String idTable,
      String idPlayerOne,
      String idPlayerTwo,
      String blackPlayer,
      @ServerTimestampConverter() FieldValue timestampCreation,
      String winner});
}

/// @nodoc
class __$GameDTOCopyWithImpl<$Res> extends _$GameDTOCopyWithImpl<$Res>
    implements _$GameDTOCopyWith<$Res> {
  __$GameDTOCopyWithImpl(_GameDTO _value, $Res Function(_GameDTO) _then)
      : super(_value, (v) => _then(v as _GameDTO));

  @override
  _GameDTO get _value => super._value as _GameDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? idTable = freezed,
    Object? idPlayerOne = freezed,
    Object? idPlayerTwo = freezed,
    Object? blackPlayer = freezed,
    Object? timestampCreation = freezed,
    Object? winner = freezed,
  }) {
    return _then(_GameDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idTable: idTable == freezed
          ? _value.idTable
          : idTable // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      timestampCreation: timestampCreation == freezed
          ? _value.timestampCreation
          : timestampCreation // ignore: cast_nullable_to_non_nullable
              as FieldValue,
      winner: winner == freezed
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameDTO extends _GameDTO {
  const _$_GameDTO(
      {@JsonKey(ignore: true) this.id,
      required this.idTable,
      required this.idPlayerOne,
      required this.idPlayerTwo,
      required this.blackPlayer,
      @ServerTimestampConverter() required this.timestampCreation,
      required this.winner})
      : super._();

  factory _$_GameDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_GameDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String idTable;
  @override
  final String idPlayerOne;
  @override
  final String idPlayerTwo;
  @override
  final String blackPlayer;
  @override
  @ServerTimestampConverter()
  final FieldValue timestampCreation;
  @override
  final String winner;

  @override
  String toString() {
    return 'GameDTO(id: $id, idTable: $idTable, idPlayerOne: $idPlayerOne, idPlayerTwo: $idPlayerTwo, blackPlayer: $blackPlayer, timestampCreation: $timestampCreation, winner: $winner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameDTO &&
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
            (identical(other.timestampCreation, timestampCreation) ||
                const DeepCollectionEquality()
                    .equals(other.timestampCreation, timestampCreation)) &&
            (identical(other.winner, winner) ||
                const DeepCollectionEquality().equals(other.winner, winner)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(idTable) ^
      const DeepCollectionEquality().hash(idPlayerOne) ^
      const DeepCollectionEquality().hash(idPlayerTwo) ^
      const DeepCollectionEquality().hash(blackPlayer) ^
      const DeepCollectionEquality().hash(timestampCreation) ^
      const DeepCollectionEquality().hash(winner);

  @JsonKey(ignore: true)
  @override
  _$GameDTOCopyWith<_GameDTO> get copyWith =>
      __$GameDTOCopyWithImpl<_GameDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GameDTOToJson(this);
  }
}

abstract class _GameDTO extends GameDTO {
  const factory _GameDTO(
      {@JsonKey(ignore: true) String? id,
      required String idTable,
      required String idPlayerOne,
      required String idPlayerTwo,
      required String blackPlayer,
      @ServerTimestampConverter() required FieldValue timestampCreation,
      required String winner}) = _$_GameDTO;
  const _GameDTO._() : super._();

  factory _GameDTO.fromJson(Map<String, dynamic> json) = _$_GameDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  String get idTable => throw _privateConstructorUsedError;
  @override
  String get idPlayerOne => throw _privateConstructorUsedError;
  @override
  String get idPlayerTwo => throw _privateConstructorUsedError;
  @override
  String get blackPlayer => throw _privateConstructorUsedError;
  @override
  @ServerTimestampConverter()
  FieldValue get timestampCreation => throw _privateConstructorUsedError;
  @override
  String get winner => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GameDTOCopyWith<_GameDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
