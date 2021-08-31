import 'package:base_de_projet/domain/game/value_objects.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../winner_page.dart';

class WinnerBottomBar extends ConsumerWidget {
  const WinnerBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final visi = watch(isVisible);
    final streamG = watch(currentGameProvider);
    bool isGameVerified = streamG.when(
      data: (game) {
        if (game == null) return false;
        switch (game.verification.getOrCrash()) {
          case VerificationWinState.none:
            return false;
          case VerificationWinState.playerOneOK:
            return false;
          case VerificationWinState.playerTwoOK:
            return false;
          case VerificationWinState.GameVerified:
            return true;
        }
      },
      loading: () => false,
      error: (err, stack) => false,
    );

    return AnimatedPositioned(
        bottom: visi.state && isGameVerified ? -10 : -300,
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
              //Text Bravo au gagant !
              Consumer(builder: (context, watch, _) {
                final streamG = watch(currentGameProvider);
                final game = streamG.data?.value;
                final winner = game?.winner.getOrCrash();
                String strWin = "";
                //Winner State
                switch (winner) {
                  case WinnerState.inProgress:
                    strWin = "...";
                    break;
                  case WinnerState.playerOneWin:
                    final streamUserData = watch(userDataPlayer(true));
                    final name =
                        streamUserData.data?.value?.userName.getOrCrash();
                    strWin = name != null ? "Bravo $name !" : '';
                    break;
                  case WinnerState.playerTwoWin:
                    final streamUserData = watch(userDataPlayer(false));
                    final name =
                        streamUserData.data?.value?.userName.getOrCrash();
                    strWin = name != null ? "Bravo $name !" : '';
                    break;
                  case WinnerState.draw:
                    strWin = "Match Nul";
                    break;
                  default:
                    return CircularProgressIndicator();
                }
                return Text(strWin,
                    style: Theme.of(context).textTheme.headline3);
              }),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, AppRouter.gameScanQrCode);
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
