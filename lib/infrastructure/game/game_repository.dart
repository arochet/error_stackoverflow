import 'package:base_de_projet/infrastructure/core/firestore_helpers.dart';
import 'package:base_de_projet/domain/auth/server_failure.dart';
import 'package:base_de_projet/infrastructure/core/check_internet_connexion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class GameRepository {
  Future<Either<ServerFailure, Unit>> createGame();
}

@LazySingleton(as: GameRepository)
class FirebaseGameFacade implements GameRepository {
  final FirebaseFirestore _firestore;

  FirebaseGameFacade(
    this._firestore,
  );

  @override
  Future<Either<ServerFailure, Unit>> createGame() async {
    if (!await checkInternetConnexion())
      return left(ServerFailure.noInternet());

    try {
      _firestore.gameDocument();
      return right(unit);
    } on FirebaseException catch (e) {
      switch (e.code) {
        default:
          return left(ServerFailure.serverError());
      }
    }
  }
}
