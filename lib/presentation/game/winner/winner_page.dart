import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
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
              Text("Match Nul !", style: Theme.of(context).textTheme.headline3),
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
    return Column(
      children: [
        SizedBox(height: 40),
        Text("Qui à gagné ?", style: Theme.of(context).textTheme.headline3),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PlayerWidget(name: "Romain", score: 1334, isBlack: true),
            PlayerWidget(name: "Sacha", score: 233, isBlack: false),
          ],
        ),
        Expanded(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                context.read(isVisible).state = !context.read(isVisible).state;
              },
              child: Text("Match Nul"),
              style: buttonPrimaryNormal,
            ),
          ),
        ),
      ],
    );
  }
}

class PlayerWidget extends StatelessWidget {
  final String name;
  final double score;
  final bool isBlack;
  const PlayerWidget({
    required this.name,
    required this.score,
    required this.isBlack,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          CircleAvatar(radius: 40),
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
      Text(name, style: Theme.of(context).textTheme.headline3),
      Text(score.toInt().toString(),
          style: Theme.of(context).textTheme.headline5),
    ]);
  }
}
