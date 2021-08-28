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

final currentPhotoProfile = FutureProvider.autoDispose<Image?>((ref) async {
  return await getIt<AuthRepository>().getPhotoProfile();
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

final gameNotifierProvider =
    StateNotifierProvider<GameNotifier, MyCurrentGameData>(
  (ref) => GameNotifier(ref.watch(gameRepositoryProvider)),
);
