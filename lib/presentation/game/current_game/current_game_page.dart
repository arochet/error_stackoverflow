import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:flutter/material.dart';

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

class CurrentGameAppbar extends StatelessWidget {
  const CurrentGameAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          color: blueColor,
          child: Center(
            child: Text(
              "Table 12",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: PlayerRow(nom: "Romain", score: 1334),
        )
      ],
    );
  }
}

class PlayerRow extends StatelessWidget {
  final String nom;
  final double score;
  const PlayerRow({
    Key? key,
    required this.nom,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(radius: 30),
        SizedBox(width: 10),
        Text(
          nom,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(width: 10),
        Text(
          score.toInt().toString(),
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}

class CurrentGameBody extends StatelessWidget {
  const CurrentGameBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Partie en cours ..",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRouter.gameChooseTeam),
            child: Container(
              width: 200,
              height: 200,
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentGameBottombar extends StatelessWidget {
  const CurrentGameBottombar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Center(
          child: PlayerRow(nom: "Sacha", score: 2343),
        ),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.gameWinner);
            },
            child: Text("Terminer la partie ?"),
            style: buttonPrimaryNormal,
          ),
        )
      ],
    );
  }
}
