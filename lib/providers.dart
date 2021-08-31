import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/application/account/modify_form_notifier.dart';
import 'package:base_de_projet/application/account/new_password_form_notifier.dart';
import 'package:base_de_projet/application/account/reauthenticate_form_notifier.dart';
import 'package:base_de_projet/application/auth/register_form_notifier.dart';
import 'package:base_de_projet/application/auth/reset_password_notifier.dart';
import 'package:base_de_projet/application/auth/sign_in_form_notifier.dart';
import 'package:base_de_projet/application/game/game_notifier.dart';
import 'package:base_de_projet/domain/auth/user_auth.dart';
import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/domain/game/game.dart';
import 'package:base_de_projet/domain/game/statistiques.dart';
import 'package:base_de_projet/domain/game/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/core/errors.dart';
import 'infrastructure/auth/auth_repository.dart';
import 'infrastructure/game/game_repository.dart';
import 'injection.dart';

//AUTHENTIFICATION
final authRepositoryProvider =
    Provider<AuthRepository>((ref) => getIt<AuthRepository>());

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) =>
      AuthNotifier(ref.watch(authRepositoryProvider))..authCheckRequested(),
);

//FORM => CONNEXION / REGISTER / MODIFY
final signInFormNotifierProvider =
    StateNotifierProvider.autoDispose<SignInFormNotifier, SignInFormData>(
  (ref) => SignInFormNotifier(ref.watch(authRepositoryProvider)),
);

final registerFormNotifierProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormData>(
  (ref) => RegisterFormNotifier(ref.watch(authRepositoryProvider)),
);

final modifyFormNotifierProvider =
    StateNotifierProvider.autoDispose<ModifyFormNotifier, ModifyFormData>(
  (ref) => ModifyFormNotifier(ref.watch(authRepositoryProvider)),
);

final reauthenticateFormNotifierProvider = StateNotifierProvider.autoDispose<
    ReauthenticateFormNotifier, ReauthenticateFormData>(
  (ref) => ReauthenticateFormNotifier(ref.watch(authRepositoryProvider)),
);

final newPasswordFormNotifierProvider = StateNotifierProvider.autoDispose<
    NewPasswordFormNotifier, NewPasswordFormData>(
  (ref) => NewPasswordFormNotifier(ref.watch(authRepositoryProvider)),
);

final resetPasswordFormNotifierProvider = StateNotifierProvider.autoDispose<
    ResetPasswordFormNotifier, ResetPasswordFormData>(
  (ref) => ResetPasswordFormNotifier(ref.watch(authRepositoryProvider)),
);

//USER
final currentUser = FutureProvider.autoDispose<UserAuth>((ref) async {
  final userOption = await getIt<AuthRepository>().getSignedUser();
  return userOption.getOrElse(() => throw NotAuthenticatedError);
});

final currentUserData = FutureProvider.autoDispose<UserData?>((ref) async {
  ref.watch(currentUser);
  final userOption = await getIt<AuthRepository>().getUserData();
  final user = userOption.getOrElse(() => UserData.empty());

  if (user == UserData.empty() || userOption.isNone())
    return null;
  else
    return user;
});

final userDataFromId =
    FutureProvider.family<UserData?, String>((ref, idPlayer) async {
  final userOption = await getIt<AuthRepository>()
      .getUserDataWithId(UniqueId.fromUniqueString(idPlayer));
  final user = userOption.getOrElse(() => UserData.empty());

  if (user == UserData.empty() || userOption.isNone())
    return null;
  else
    return user;
});

final currentPhotoProfile = FutureProvider.autoDispose<Image?>((ref) async {
  return await getIt<AuthRepository>().getPhotoProfile();
});

final playerPhotoProfile =
    FutureProvider.family<Image?, UniqueId>((ref, id) async {
  return await getIt<AuthRepository>().getPhotoProfileOfPlayer(id);
});

final statistiquesCurrentUser =
    FutureProvider.autoDispose<Statistiques?>((ref) async {
  final user = await ref.watch(currentUser.future);
  return await getIt<GameRepository>().getStatistiques(user.id);
});

final statistiquesPlayer =
    FutureProvider.family<Statistiques?, UniqueId>((ref, id) async {
  return await getIt<GameRepository>()
      .getStatistiques(UniqueId.fromUniqueString(id.getOrCrash()));
});

//GAME
final gameRepositoryProvider =
    Provider<GameRepository>((ref) => getIt<GameRepository>());

final uniqueIdCurrentGameProvider = StateProvider<UniqueId?>((ref) => null);

final currentGameProvider = StreamProvider<Game?>((ref) {
  final id = ref.watch(uniqueIdCurrentGameProvider).state;
  if (id != null)
    return ref.watch(gameRepositoryProvider).getCurrentGame(id);
  else
    return Stream.empty();
});

/* final currentGameVerification = StreamProvider<VerificationWin>((ref) {
  final streamG = ref.watch(currentGameProvider);
  return streamG.when(
    data: (game) {
      if (game == null) return Stream.empty();
      return game.verification;
    },
    loading: () => Stream.empty(),
    error: (err, stack) => Stream.empty(),
  );
}); */

final gameNotifierProvider =
    StateNotifierProvider<GameNotifier, MyCurrentGameData>(
  (ref) => GameNotifier(ref.watch(gameRepositoryProvider)),
);

final userDataPlayer =
    FutureProvider.family<UserData?, bool>((ref, isPlayerOne) async {
  final game = ref.watch(currentGameProvider).data?.value;
  if (game == null) return null;

  final strId = isPlayerOne ? game.idPlayerOne : game.idPlayerTwo;
  if (strId.isEmpty) {
    print("STR ID is null !");
    return null;
  }
  final userOption = await getIt<AuthRepository>()
      .getUserDataWithId(UniqueId.fromUniqueString(strId));
  final user = userOption.getOrElse(() => UserData.empty());

  if (user == UserData.empty() || userOption.isNone())
    return null;
  else
    return user;
});
