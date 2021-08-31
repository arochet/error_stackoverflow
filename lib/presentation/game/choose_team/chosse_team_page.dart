import 'package:base_de_projet/application/game/game_notifier.dart';
import 'package:base_de_projet/domain/game/value_objects.dart';
import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/game/widget/flushbar_game_failure.dart';
import 'package:base_de_projet/presentation/game/widget/text_table.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseTeamPage extends StatelessWidget {
  const ChooseTeamPage({Key? key}) : super(key: key);

  get gameNotifierProvider => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWithAppbar(
        appbar: ChooseTeamAppbar(),
        backgroundColorAppbar: blueMarineColor,
        heightAppBar: 160,
        body: ChooseTeamBody(),
        bottombar: ChooseTeamBottombar(),
        heightBottomBar: 200,
      ),
    );
  }
}

class ChooseTeamBottombar extends StatelessWidget {
  const ChooseTeamBottombar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: gameNotifierProvider,
      onChange: (BuildContext context, MyCurrentGameData myCurrentGameData) {
        myCurrentGameData.iAmBlackPlayerOrFailure.fold(
            () {},
            (either) => either.fold((failure) {
                  //Message d'erreur
                  FlushbarGameFailure.show(context, failure);
                }, (_id) {
                  Future.delayed(Duration.zero, () async {
                    Navigator.pushNamed(context, AppRouter.gameCurrent);
                  });
                }));
      },
      child: Consumer(builder: (context, watch, _) {
        final streamG = watch(currentGameProvider);
        return streamG.when(
          data: (game) {
            if (game == null) return Container();

            switch (game.blackPlayer.getOrCrash()) {
              case BlackPlayerState.playerOne:
                return Center(
                  child: _buildAvatarTeam(context, true),
                );
              case BlackPlayerState.playerTwo:
                return Center(
                  child: _buildAvatarTeam(context, false),
                );
              default:
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildAvatarTeam(context, true),
                      SizedBox(width: 40),
                      _buildAvatarTeam(context, false),
                    ],
                  ),
                );
            }
          },
          loading: () => CircularProgressIndicator(),
          error: (err, stack) => Text(err.toString()),
        );
      }),
    );
  }

  Widget _buildAvatarTeam(BuildContext context, bool teamBlack) {
    return GestureDetector(
      onTap: () =>
          context.read(gameNotifierProvider.notifier).setBlackPlayer(teamBlack),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: teamBlack
                ? AssetImage("assets/icon/icon-chess-choose-team-white.png")
                : AssetImage("assets/icon/icon-chess-choose-team-black.png"),
          ),
          SizedBox(height: 10),
          Text(
            teamBlack ? "Noir" : "Blanc",
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}

class ChooseTeamBody extends ConsumerWidget {
  const ChooseTeamBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final streamG = watch(currentGameProvider);
    return streamG.when(
      data: (game) {
        if (game == null) return CircularProgressIndicator();

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NameOfPlayer(true),
              SizedBox(height: 20),
              Container(
                width: 200,
                height: 200,
                child: Image(image: AssetImage("assets/images/plateau.png")),
              ),
              SizedBox(height: 20),
              NameOfPlayer(false),
            ],
          ),
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text(err.toString()),
    );
  }
}

class NameOfPlayer extends ConsumerWidget {
  final bool isFirst;
  const NameOfPlayer(this.isFirst, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final streamUserData = watch(userDataPlayer(isFirst));
    return streamUserData.when(
      data: (data) {
        if (data == null) return Text("");
        return Text(
          data.userName.getOrCrash(),
          style: Theme.of(context).textTheme.headline3,
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text(err.toString()),
    );
  }
}

class ChooseTeamAppbar extends StatelessWidget {
  const ChooseTeamAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextTableWidget(),
      ),
    );
  }
}
