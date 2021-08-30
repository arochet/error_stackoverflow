import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/domain/game/game_failure.dart';
import 'package:flutter/material.dart';

class FlushbarGameFailure {
  static show(context, GameFailure failure) => Flushbar(
        duration: const Duration(seconds: 3),
        icon: const Icon(Icons.warning),
        messageColor: Colors.red,
        message: failure.map(
          noInternet: (_) => 'Pas d\'internet',
          serverError: (_) => 'Server Error',
          userAlreadyCreatedGame: (_) => 'Vous avez déjà créé une partie',
        ),
      ).show(context);
}
