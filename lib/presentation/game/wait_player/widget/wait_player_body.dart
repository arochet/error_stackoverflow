import 'package:base_de_projet/application/game/game_notifier.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/domain/game/statistiques.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/game/widget/flushbar_game_failure.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaitPlayerBody extends StatelessWidget {
  const WaitPlayerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: gameNotifierProvider,
      onChange: (BuildContext context, MyCurrentGameData myCurrentGameData) {
        myCurrentGameData.idGameFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failure) {
                  //Message d'erreur
                  FlushbarGameFailure.show(context, failure);
                }, (_id) {
                  Future.delayed(Duration.zero, () async {
                    context.read(uniqueIdCurrentGameProvider).state = _id;
                    Navigator.pushNamed(context, AppRouter.gameChooseTeam);
                  });
                }));
      },
      child: WaitPlayerBodyWidget(),
    );
  }
}

final streamTwoPlayerProvider = StreamProvider<UniqueId?>((ref) {
  final idCurrentGame = ref.watch(uniqueIdCurrentGameProvider).state;
  if (idCurrentGame == null) {
    return Stream.empty();
  }
  final res =
      ref.watch(gameRepositoryProvider).currentGameHaveTwoPlayer(idCurrentGame);
  print(res);
  return res;
});

class WaitPlayerBodyWidget extends ConsumerWidget {
  const WaitPlayerBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final stream = watch(streamTwoPlayerProvider);

    return stream.when(
        data: (idOtherPlayer) {
          print("foundTwoPlayer $idOtherPlayer");
          if (idOtherPlayer != null) {
            final streamOtherPlayerData =
                watch(userDataFromId(idOtherPlayer.getOrCrash()));
            final name =
                streamOtherPlayerData.data?.value?.userName.getOrCrash();
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Jouez contre $name",
                        style: Theme.of(context).textTheme.headline3),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.gameChooseTeam);
                      },
                      child: Text("Continuer"),
                      style: buttonPrimaryNormal,
                    ),
                  ]),
            );
          }

          //Waiting for other player
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "En l'attente de l'autre joueur...",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 30),
                Container(
                  color: Colors.black12,
                  width: 200,
                  height: 200,
                  child: Image(image: AssetImage("assets/images/plateau.png")),
                ),
                SizedBox(height: 20),
                Consumer(builder: (context, watch, _) {
                  final userData = watch(currentUserData);
                  final streamS = watch(statistiquesCurrentUser);
                  if (userData.data != null && userData.data!.value != null) {
                    //Value okay
                    return Column(
                      children: [
                        Text(
                          userData.data!.value!.userName.getOrCrash(),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                            streamS.when(
                              data: (stats) {
                                stats = stats ?? Statistiques.empty();
                                return stats.score.toString();
                              },
                              loading: () => '',
                              error: (err, stack) => err.toString(),
                            ),
                            style: Theme.of(context).textTheme.headline5),
                      ],
                    );
                  } else {
                    //Value Null !
                    return Column(
                      children: [
                        Text("", style: Theme.of(context).textTheme.headline3),
                        Text("", style: Theme.of(context).textTheme.headline5),
                      ],
                    );
                  }
                }),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final idGame = context.read(uniqueIdCurrentGameProvider);
                    if (idGame.state != null)
                      await context
                          .read(gameRepositoryProvider)
                          .cancelGame(idGame.state!);
                    Navigator.pushReplacementNamed(context, AppRouter.home);
                  },
                  child: Text("Quitter"),
                  style: buttonPrimaryNormal,
                )
              ],
            ),
          );
        },
        loading: () => CircularProgressIndicator(),
        error: (err, st) => ListView(
              children: [
                Text(st.toString()),
              ],
            ));
  }
}
