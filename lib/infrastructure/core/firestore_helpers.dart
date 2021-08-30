import 'package:base_de_projet/domain/auth/user_auth.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/infrastructure/auth/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:base_de_projet/domain/core/errors.dart';

import '../../injection.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final user = await getUser();
    return FirebaseFirestore.instance
        .collection('user')
        .doc(user.id.getOrCrash());
  }

  Future<DocumentReference> playerDocument(UniqueId idPlayer) async {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(idPlayer.getOrCrash());
  }

  CollectionReference gameDocument() {
    return FirebaseFirestore.instance.collection('game');
  }

  CollectionReference get passwordClearCollection =>
      collection('passwordClear');

  Future<UserAuth> getUser() async {
    final userOption = await getIt<AuthRepository>().getSignedUser();
    return userOption.getOrElse(() => throw NotAuthenticatedError);
  }
}
