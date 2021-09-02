import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:flutter/material.dart';

import '../current_game_page.dart';

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
          child: PlayerRow(idPlayerOne: false),
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
