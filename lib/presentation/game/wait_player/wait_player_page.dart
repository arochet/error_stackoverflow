import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/game/wait_player/widget/wait_player_body.dart';
import 'package:flutter/material.dart';

class WaitPlayerPage extends StatelessWidget {
  const WaitPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWithAppbar(
        backgroundColorAppbar: blueMarineColor,
        appbar: WaitPlayerAppbar(),
        body: WaitPlayerBody(),
        heightAppBar: 160,
      ),
    );
  }
}

class WaitPlayerAppbar extends StatelessWidget {
  const WaitPlayerAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Table 12",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
