import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/game/current_game/widget/current_game_appbar.dart';
import 'package:base_de_projet/presentation/game/current_game/widget/current_game_body.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/current_gamebottombar.dart';

class CurrentGamePage extends StatelessWidget {
  const CurrentGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWithAppbar(
        appbar: CurrentGameAppbar(),
        heightAppBar: 200,
        body: CurrentGameBody(),
        bottombar: CurrentGameBottombar(),
        heightBottomBar: 200,
      ),
    );
  }
}

class PlayerRow extends StatelessWidget {
  final bool idPlayerOne;
  const PlayerRow({
    Key? key,
    required this.idPlayerOne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Consumer(builder: (context, watch, _) {
        final streamUserData = watch(userDataPlayer(idPlayerOne));
        return streamUserData.when(
            data: (userData) {
              if (userData == null)
                return Center(
                  child: Text("Error : Player Not Found"),
                );
              else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 30),
                    SizedBox(width: 10),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        userData.userName.getOrCrash(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "1234",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                );
              }
            },
            loading: () => CircularProgressIndicator(),
            error: (err, stack) => Center(
                  child: Text(err.toString()),
                ));
      });
    });
  }
}
