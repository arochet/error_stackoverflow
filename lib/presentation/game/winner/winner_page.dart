import 'package:base_de_projet/application/game/game_notifier.dart';
import 'package:base_de_projet/domain/game/value_objects.dart';
import 'package:base_de_projet/presentation/components/avatar.dart';
import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/game/widget/flushbar_game_failure.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isVisible = StateProvider((ref) => false);

class WinnerPage extends StatelessWidget {
  const WinnerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWithAppbar(
        appbar: WinnerAppbar(),
        heightAppBar: 350,
        body: Container(),
        customBottomBar: WinnerBottomBar(),
      ),
    );
  }
}

class WinnerBottomBar extends ConsumerWidget {
  const WinnerBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final visi = watch(isVisible);

    return AnimatedPositioned(
        bottom: visi.state ? -10 : -300,
        duration: Duration(milliseconds: 100),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 17,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          //PANEL REJOUER !
          child: Column(
            children: [
              Expanded(child: Container()),
              Consumer(builder: (context, watch, _) {
                final streamG = watch(currentGameProvider);
                final game = streamG.data?.value;
                final winner = game?.winner.getOrCrash();
                switch (winner) {
                  case WinnerState.inProgress:
                    return Text("error",
                        style: Theme.of(context).textTheme.headline3);
                  case WinnerState.playerOneWin:
                    final streamUserData = watch(userDataPlayer(true));
                    final name =
                        streamUserData.data?.value?.userName.getOrCrash();
                    return Text(name != null ? name : '',
                        style: Theme.of(context).textTheme.headline3);
                  case WinnerState.playerTwoWin:
                    final streamUserData = watch(userDataPlayer(false));
                    final name =
                        streamUserData.data?.value?.userName.getOrCrash();
                    return Text(name != null ? name : '',
                        style: Theme.of(context).textTheme.headline3);
                  case WinnerState.draw:
                    return Text("Match Nul",
                        style: Theme.of(context).textTheme.headline3);
                  default:
                    return CircularProgressIndicator();
                }
              }),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.gameScanQrCode);
                },
                child: Text("Rejouer ?"),
                style: buttonPrimaryNormal,
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRouter.home);
                },
                child: Text("Page d'accueil"),
                style: buttonTertiaryNormal,
              ),
              Expanded(child: Container()),
            ],
          ),
        ));
  }
}

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
          Text("Qui à gagné ?", style: Theme.of(context).textTheme.headline3),
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
                            isFirstPlayer: true,
                            isBlack: game.blackPlayer.getOrCrash() ==
                                BlackPlayerState.playerOne)),
                    GestureDetector(
                        onTap: () => context
                            .read(gameNotifierProvider.notifier)
                            .setWin(WinnerState.playerTwoWin),
                        child: PlayerWidget(
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
        ],
      ),
    );
  }
}

class PlayerWidget extends ConsumerWidget {
  final bool isFirstPlayer;
  final bool isBlack;
  const PlayerWidget({
    required this.isFirstPlayer,
    required this.isBlack,
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
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(userData.userName.getOrCrash(),
                style: Theme.of(context).textTheme.headline3),
            Text("1234", style: Theme.of(context).textTheme.headline5),
          ]);
        }
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Center(child: Text("Error : $error")),
    );
  }
}
