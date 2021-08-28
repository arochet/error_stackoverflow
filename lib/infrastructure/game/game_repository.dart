import 'package:base_de_projet/domain/auth/user_auth.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/domain/game/game.dart';
import 'package:base_de_projet/domain/game/game_failure.dart';
import 'package:base_de_projet/domain/game/value_objects.dart';
import 'package:base_de_projet/infrastructure/core/firestore_helpers.dart';
import 'package:base_de_projet/infrastructure/core/check_internet_connexion.dart';
import 'package:base_de_projet/infrastructure/game/game_dtos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class GameRepository {
  Future<Either<GameFailure, UniqueId>> createGame(String idTable);
  Future<Either<GameFailure, UniqueId>> newGame(String idTable);
  Stream<Game?> getCurrentGame(UniqueId idCurrentGame);
  Stream<bool> currentGameHaveTwoPlayer(UniqueId idCurrentGame);
}

@LazySingleton(as: GameRepository)
class FirebaseGameFacade implements GameRepository {
  final FirebaseFirestore _firestore;

  FirebaseGameFacade(
    this._firestore,
  );

  @override
  Future<Either<GameFailure, UniqueId>> createGame(String idTable) async {
    final user = await _firestore.getUser();
    try {
      final game = await _firestore.gameDocument();
      Game newG = Game.empty(idTable, user.id.getOrCrash());
      final doc = await game.add(GameDTO.fromDomain(newG).toJson());
      return right(UniqueId.fromUniqueString(doc.id));
    } on FirebaseException catch (e) {
      switch (e.code) {
        default:
          return left(GameFailure.serverError());
      }
    }
  }

  @override
  Future<Either<GameFailure, UniqueId>> newGame(String idTable) async {
    if (!await checkInternetConnexion()) return left(GameFailure.noInternet());

    final user = await _firestore.getUser();

    try {
      final parties = this
          ._firestore
          .gameDocument()
          .where('idTable', isEqualTo: idTable)
          .where('idPlayerOne', isNotEqualTo: "")
          .where('idPlayerTwo', isEqualTo: "")
          .where('winner', isEqualTo: WinnerState.inProgress.toShortString());

      // parties.snapshots().map((snap) => null);
      print(parties);
      return parties.get().then((QuerySnapshot querySnapshot) async {
        final len = querySnapshot.docs.length;
        print("lenght $len");
        if (len == 0) {
          //create game
          final idOrFailure = await this.createGame(idTable);
          print("idOrFailure");
          print(idOrFailure);
          return idOrFailure.fold((l) => left(l), (r) => right(r));
        } else if (len == 1) {
          //join game
          return await joinGameCreated(querySnapshot, user);
        } else {
          //C'est la mer noire
          return await joinGameCreated(querySnapshot, user);
        }
      });
    } on FirebaseException catch (e) {
      switch (e.code) {
        default:
          return left(GameFailure.serverError());
      }
    }
  }

  Future<Either<GameFailure, UniqueId>> joinGameCreated(
      QuerySnapshot querySnapshot, UserAuth user) async {
    final idGame = querySnapshot.docs.first.id;
    final doc = this._firestore.gameDocument().doc(idGame);
    if (GameDTO.fromFirestore(await doc.get()).idPlayerOne !=
        user.id.getOrCrash()) {
      doc.update({'idPlayerTwo': user.id.getOrCrash()});
      return right(UniqueId.fromUniqueString(idGame));
    } else {
      return right(UniqueId.fromUniqueString(idGame));
    }
  }

  @override
  Stream<Game?> getCurrentGame(UniqueId idCurrentGame) {
    return this
        ._firestore
        .gameDocument()
        .doc(idCurrentGame.getOrCrash())
        .snapshots()
        .map((snap) {
      print(snap);
      print(snap.data());
      return GameDTO.fromFirestore(snap).toDomain();
    });
  }

  @override
  Stream<bool> currentGameHaveTwoPlayer(UniqueId idCurrentGame) {
    Stream<Game?> game = getCurrentGame(idCurrentGame);
    if (game == null) {
      return Stream.error("Game is fucking null");
    }

    return game.map((g) {
      if (g != null) {
        if (g.idPlayerOne == g.idPlayerTwo) {
          return false;
        }
        return g.idPlayerOne != "" && g.idPlayerTwo != "";
      } else
        return false;
    });
  }
}
