// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameDTO _$_$_GameDTOFromJson(Map<String, dynamic> json) {
  return _$_GameDTO(
    idTable: json['idTable'] as String,
    idPlayerOne: json['idPlayerOne'] as String,
    idPlayerTwo: json['idPlayerTwo'] as String,
    blackPlayer: json['blackPlayer'] as String,
    timestampCreation: const ServerTimestampConverter()
        .fromJson(json['timestampCreation'] as Object),
    winner: json['winner'] as String,
  );
}

Map<String, dynamic> _$_$_GameDTOToJson(_$_GameDTO instance) =>
    <String, dynamic>{
      'idTable': instance.idTable,
      'idPlayerOne': instance.idPlayerOne,
      'idPlayerTwo': instance.idPlayerTwo,
      'blackPlayer': instance.blackPlayer,
      'timestampCreation':
          const ServerTimestampConverter().toJson(instance.timestampCreation),
      'winner': instance.winner,
    };
