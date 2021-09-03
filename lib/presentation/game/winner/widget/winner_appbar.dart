import 'package:base_de_projet/application/game/game_notifier.dart';
import 'package:base_de_projet/presentation/components/avatar.dart';
import 'package:base_de_projet/domain/game/value_objects.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/game/widget/flushbar_game_failure.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../winner_page.dart';

class WinnerAppbar extends StatelessWidget {
  const WinnerAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: gameNotifierProvider,
      onChange: (BuildContext context, MyCurrentGameData myCurrentGameData) {
        myCurrentGameData.setWinnerOrFailure.fold(
            () {},
            (either) => either.fold((failure) {
                  //Message d'erreur
                  FlushbarGameFailure.show(context, failure);
                }, (_id) {
                  Future.delayed(Duration.zero, () async {
                    context.read(isVisible).state = true;
                  });
                }));
      },
      child: Column(
        children: [
          SizedBox(height: 40),
          Text("Qui a gagné ?", style: Theme.of(context).textTheme.headline3),
          SizedBox(height: 5),
          Text("Sélectionnez le joueur", style: txtStyleSubtitleGrey),
          SizedBox(height: 20),
          Consumer(builder: (context, watch, _) {
            final game = watch(currentGameProvider);
            return game.when(
              data: (game) {
                if (game == null) return Center(child: Text("Game Not Found"));
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => context
                            .read(gameNotifierProvider.notifier)
                            .setWin(WinnerState.playerOneWin),
                        child: PlayerWidget(
                            isWinning: game.winner.getOrCrash() ==
                                WinnerState.playerOneWin,
                            isFirstPlayer: true,
                            isBlack: game.blackPlayer.getOrCrash() ==
                                BlackPlayerState.playerOne)),
                    GestureDetector(
                        onTap: () => context
                            .read(gameNotifierProvider.notifier)
                            .setWin(WinnerState.playerTwoWin),
                        child: PlayerWidget(
                            isWinning: game.winner.getOrCrash() ==
                                WinnerState.playerTwoWin,
                            isFirstPlayer: false,
                            isBlack: game.blackPlayer.getOrCrash() ==
                                BlackPlayerState.playerTwo)),
                  ],
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (Object error, StackTrace? stackTrace) =>
                  Center(child: Text("Error $error")),
            );
          }),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read(gameNotifierProvider.notifier)
                      .setWin(WinnerState.draw);
                },
                child: Text("Match Nul"),
                style: buttonPrimaryNormal,
              ),
            ),
          ),
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Consumer(builder: (context, watch, child) {
                  final streamG = watch(currentGameProvider);
                  String verif = streamG.when(
                    data: (game) {
                      if (game == null) return "";
                      switch (game.verification.getOrCrash()) {
                        case VerificationWinState.none:
                          return "";
                        case VerificationWinState.playerOneOK:
                          return "En attente de vérification des deux joueurs";
                        case VerificationWinState.playerTwoOK:
                          return "En attente de vérification des deux joueurs";
                        case VerificationWinState.GameVerified:
                          return "Partie vérifiée";
                      }
                    },
                    loading: () => "...",
                    error: (err, stack) => "- Error -",
                  );
                  return Text(verif,
                      style: Theme.of(context).textTheme.headline5);
                }),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class PlayerWidget extends ConsumerWidget {
  final bool isFirstPlayer;
  final bool isBlack;
  final bool isWinning;
  const PlayerWidget({
    required this.isFirstPlayer,
    required this.isBlack,
    required this.isWinning,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final streamUserData = watch(userDataPlayer(isFirstPlayer));
    return streamUserData.when(
      data: (userData) {
        if (userData == null)
          return Center(
            child: Text("Error : Player Not Found"),
          );
        else {
          final streamS = watch(statistiquesPlayer(userData.id));
          final data = streamS.data ?? null;
          final asyncStat = data != null ? data.value : null;
          final score = asyncStat != null ? asyncStat.score : 0;
          return Column(children: [
            Stack(
              children: [
                AvatarPlayerWidget(
                  size: 40,
                  idPlayer: userData.id,
                ),
                Positioned(
                  top: 3,
                  right: 3,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: isBlack ? Colors.black : Colors.grey,
                    backgroundImage: isBlack
                        ? AssetImage(
                            "assets/icon/icon-chess-choose-team-white.png")
                        : AssetImage(
                            "assets/icon/icon-chess-choose-team-black.png"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(userData.userName.getOrCrash(),
                style: Theme.of(context).textTheme.headline3),
            Text(score.toString(),
                style: Theme.of(context).textTheme.headline5),
            SizedBox(height: 5),
            if (isWinning) Container(width: 20, height: 5, color: Colors.black)
          ]);
        }
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Center(child: Text("Error : $error")),
    );
  }
}
