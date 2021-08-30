import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/game/widget/text_table.dart';
import 'package:flutter/material.dart';

import '../current_game_page.dart';

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
            child: TextTableWidget(),
          ),
        ),
        Expanded(
          child: PlayerRow(idPlayerOne: true),
        )
      ],
    );
  }
}
