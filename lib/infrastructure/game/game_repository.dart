import 'package:base_de_projet/domain/auth/user_auth.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/domain/game/game.dart';
import 'package:base_de_projet/domain/game/game_failure.dart';
import 'package:base_de_projet/domain/game/statistiques.dart';
import 'package:base_de_projet/domain/game/value_objects.dart';
import 'package:base_de_projet/infrastructure/auth/auth_repository.dart';
import 'package:base_de_projet/infrastructure/core/firestore_helpers.dart';
import 'package:base_de_projet/infrastructure/core/check_internet_connexion.dart';
import 'package:base_de_projet/infrastructure/game/game_dtos.dart';
import 'package:base_de_projet/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class GameRepository {
  Future<Either<GameFailure, UniqueId>> createGame(String idTable);
  Future<Either<GameFailure, UniqueId>> newGame(String idTable);
  Stream<Game?> getCurrentGame(UniqueId idCurrentGame);
  Stream<UniqueId?> currentGameHaveTwoPlayer(UniqueId idCurrentGame);
  Future<Either<GameFailure, bool>> setBlackPlayer(
      bool isBlackPlayer, UniqueId idGame);
  Future<Either<GameFailure, bool>> isFirstPlayer(UniqueId idCurrentGame);
  Future<Either<GameFailure, Unit>> enGame(
      UniqueId idCurrentGame, WinnerState win);
  Future<Either<GameFailure, Unit>> cancelGame(UniqueId idGame);
  Future<Statistiques?> getStatistiques(UniqueId id);
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
      final game = _firestore.gameDocument();
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
      return parties.get().then((QuerySnapshot querySnapshot) async {
        final len = querySnapshot.docs.length;
        if (len == 0) {
          //create game
          final idOrFailure = await this.createGame(idTable);
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
      return GameDTO.fromFirestore(snap).toDomain();
    });
  }

  @override
  Stream<UniqueId?> currentGameHaveTwoPlayer(UniqueId idCurrentGame) {
    Stream<Game?> streamGame = getCurrentGame(idCurrentGame);
    final idUser = getIt<AuthRepository>().getUser();
    final res = idUser.fold(() => null, (user) {
      return streamGame.map((g) {
        if (g != null) {
          if (g.idPlayerOne == g.idPlayerTwo) {
            return null;
          }
          if (g.idPlayerOne != "" && g.idPlayerTwo != "") {
            if (g.idPlayerOne == user.uid)
              return UniqueId.fromUniqueString(g.idPlayerTwo);
            else
              return UniqueId.fromUniqueString(g.idPlayerOne);
          } else {
            return null;
          }
        } else
          return null;
      });
    });

    if (res == null)
      return Stream.empty();
    else
      return res;
  }

  @override
  Future<Either<GameFailure, bool>> setBlackPlayer(
      bool isBlackPlayer, UniqueId idGame) async {
    if (!await checkInternetConnexion()) return left(GameFailure.noInternet());
    try {
      final doc = this._firestore.gameDocument().doc(idGame.getOrCrash());
      final eitherIsFirstPlayer = await this.isFirstPlayer(idGame);
      return eitherIsFirstPlayer.fold((l) => left(GameFailure.serverError()),
          (isFirstPlayer) {
        if ((isBlackPlayer && isFirstPlayer) ||
            (!isBlackPlayer && !isFirstPlayer)) {
          doc.update({
            'blackPlayer': BlackPlayer(BlackPlayerState.playerOne)
                .getOrCrash()
                .toShortString()
          });
        } else {
          doc.update({
            'blackPlayer': BlackPlayer(BlackPlayerState.playerTwo)
                .getOrCrash()
                .toShortString()
          });
        }
        return right(isBlackPlayer);
      });
    } on FirebaseException catch (e) {
      switch (e.code) {
        default:
          return left(GameFailure.serverError());
      }
    }
  }

  @override
  Future<Either<GameFailure, bool>> isFirstPlayer(
      UniqueId idCurrentGame) async {
    if (!await checkInternetConnexion()) return left(GameFailure.noInternet());
    try {
      final user = await _firestore.getUser();
      final doc =
          this._firestore.gameDocument().doc(idCurrentGame.getOrCrash());
      if (GameDTO.fromFirestore(await doc.get()).idPlayerOne ==
          user.id.getOrCrash())
        return right(true);
      else if (GameDTO.fromFirestore(await doc.get()).idPlayerTwo ==
          user.id.getOrCrash())
        return right(false);
      else
        return left(GameFailure.serverError()); //Changer le message d'erreur !
    } on FirebaseException catch (e) {
      switch (e.code) {
        default:
          return left(GameFailure.serverError());
      }
    }
  }

  @override
  Future<Either<GameFailure, Unit>> enGame(
      UniqueId idCurrentGame, WinnerState win) async {
    if (!await checkInternetConnexion()) return left(GameFailure.noInternet());
    try {
      final doc =
          this._firestore.gameDocument().doc(idCurrentGame.getOrCrash());

      final eitherIsFirstPlayer = await this.isFirstPlayer(idCurrentGame);
      return eitherIsFirstPlayer.fold(
        (l) => left(GameFailure.serverError()),
        (isFirstPlayer) async {
          final gameDTO = GameDTO.fromFirestore(await doc.get());
          VerificationWinState? laVerif;
          VerificationWinState verificationEncour =
              VerificationWin.fromString(gameDTO.verification).getOrCrash();
          WinnerState winStateInGame =
              Winner.fromString(gameDTO.winner).getOrCrash();
          //Set verification
          switch (verificationEncour) {
            case VerificationWinState.none:
              if (isFirstPlayer) {
                laVerif = VerificationWinState.playerOneOK;
              } else {
                laVerif = VerificationWinState.playerTwoOK;
              }
              doc.update({'winner': win.toShortString()});
              break;
            case VerificationWinState.playerOneOK:
              if (!isFirstPlayer) {
                if (win == winStateInGame)
                  laVerif = VerificationWinState.GameVerified;
                else
                  doc.update({'winner': win.toShortString()});
              } else
                doc.update({'winner': win.toShortString()});
              break;
            case VerificationWinState.playerTwoOK:
              if (isFirstPlayer) {
                if (win == winStateInGame)
                  laVerif = VerificationWinState.GameVerified;
                else
                  doc.update({'winner': win.toShortString()});
              } else
                doc.update({'winner': win.toShortString()});
              break;
            case VerificationWinState.GameVerified:
              break;
          }
          if (laVerif != null)
            doc.update({'verification': laVerif.toShortString()});
          return right(unit);
        },
      );
    } on FirebaseException catch (e) {
      switch (e.code) {
        default:
          return left(GameFailure.serverError());
      }
    }
  }

  @override
  Future<Statistiques?> getStatistiques(UniqueId id) async {
    try {
      //Nombre de parties
      final snapshotPlayerOne = this
          ._firestore
          .gameDocument()
          .where('idPlayerOne', isEqualTo: id.getOrCrash())
          .where('winner', whereIn: [
        WinnerState.playerOneWin.toShortString(),
        WinnerState.playerTwoWin.toShortString()
      ]);
      final snapshotPlayerTwo = this
          ._firestore
          .gameDocument()
          .where('idPlayerTwo', isEqualTo: id.getOrCrash())
          .where('winner', whereIn: [
        WinnerState.playerOneWin.toShortString(),
        WinnerState.playerTwoWin.toShortString()
      ]);
      final gameOne = await snapshotPlayerOne.get();
      final gameTwo = await snapshotPlayerTwo.get();
      final len = gameOne.docs.length + gameTwo.docs.length;

      //Nombre de victoires
      final snapVictoryOne = snapshotPlayerOne.where('winner',
          isEqualTo: WinnerState.playerOneWin.toShortString());
      final snapVictoryTwo = snapshotPlayerTwo.where('winner',
          isEqualTo: WinnerState.playerTwoWin.toShortString());
      final victoryOne = await snapVictoryOne.get();
      final victoryTwo = await snapVictoryTwo.get();
      final nbVictory = victoryOne.docs.length + victoryTwo.docs.length;
      return Statistiques.empty().copyWith(
          nbGame: len, nbSuccess: nbVictory, nbDefeat: len - nbVictory);
    } on FirebaseException catch (e) {
      switch (e.code) {
        default:
          return null;
      }
    }
  }

  @override
  Future<Either<GameFailure, Unit>> cancelGame(UniqueId idGame) async {
    if (!await checkInternetConnexion()) return left(GameFailure.noInternet());
    try {
      final doc = this._firestore.gameDocument().doc(idGame.getOrCrash());
      doc.update({'winner': WinnerState.cancelled.toShortString()});
      return right(unit);
    } on FirebaseException catch (e) {
      switch (e.code) {
        default:
          return left(GameFailure.serverError());
      }
    }
  }
}
