import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/game/game_notifier.dart';
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

final streamTwoPlayerProvider = StreamProvider<bool>((ref) {
  final id = ref.watch(uniqueIdCurrentGameProvider).state;
  print("my ${id!.getOrCrash()}");
  if (id == null) {
    return Stream<bool>.empty();
  }
  return ref.watch(gameRepositoryProvider).currentGameHaveTwoPlayer(id);
});

class WaitPlayerBodyWidget extends ConsumerWidget {
  const WaitPlayerBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final stream = watch(streamTwoPlayerProvider);

    return stream.when(
        data: (foundTwoPlayer) {
          if (foundTwoPlayer == true) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Second joueur trouvé !",
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
                  child: Placeholder(),
                ),
                SizedBox(height: 20),
                Consumer(builder: (context, watch, _) {
                  final userData = watch(currentUserData);
                  if (userData.data != null && userData.data!.value != null) {
                    //Value okay
                    return Column(
                      children: [
                        Text(
                          userData.data!.value!.userName.getOrCrash(),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text("1335",
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
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, AppRouter.home),
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
