import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/domain/game/value_objects.dart';
import 'package:base_de_projet/domain/game/game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'game_dtos.freezed.dart';
part 'game_dtos.g.dart';

@freezed
abstract class GameDTO implements _$GameDTO {
  const GameDTO._();

  const factory GameDTO({
    @JsonKey(ignore: true) String? id,
    required String idTable,
    required String idPlayerOne,
    required String idPlayerTwo,
    required String blackPlayer,
    @ServerTimestampConverter() required FieldValue timestampCreation,
    required String
        winner, //4 états : en cours / joueur1 / joueur2 / Match Null
  }) = _GameDTO;

  factory GameDTO.fromDomain(Game game) {
    return GameDTO(
      blackPlayer: game.blackPlayer.getOrCrash().toShortString(),
      idTable: game.idTable.getOrCrash(),
      idPlayerOne: game.idPlayerOne,
      idPlayerTwo: game.idPlayerTwo,
      timestampCreation: FieldValue.serverTimestamp(),
      winner: game.winner.getOrCrash().toShortString(),
    );
  }

  Game toDomain() {
    print("c'estla mer noire");

    return Game(
      id: UniqueId.fromUniqueString(id!),
      blackPlayer: BlackPlayer.fromString(blackPlayer),
      idTable: TableId(idTable),
      idPlayerOne: idPlayerOne,
      idPlayerTwo: idPlayerTwo,
      winner: Winner.fromString(winner),
    );
  }

  factory GameDTO.fromJson(Map<String, dynamic> json) =>
      _$GameDTOFromJson(json);

  factory GameDTO.fromFirestore(DocumentSnapshot doc) {
    return GameDTO.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}
