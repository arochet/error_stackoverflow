import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/winner_appbar.dart';
import 'widget/winner_bottom_bar.dart';

final isVisible = StateProvider((ref) => false);

class WinnerPage extends StatelessWidget {
  const WinnerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWithAppbar(
        appbar: WinnerAppbar(),
        heightAppBar: 380,
        body: Column(
          children: [
            Expanded(child: Container()),
            ElevatedButton(
              onPressed: () async {
                final idGame = context.read(uniqueIdCurrentGameProvider);
                if (idGame.state != null)
                  await context
                      .read(gameRepositoryProvider)
                      .cancelGame(idGame.state!);
                Navigator.pushReplacementNamed(context, AppRouter.home);
              },
              child: Text("Annuler la partie"),
              style: buttonPrimaryNormal,
            ),
          ],
        ),
        customBottomBar: WinnerBottomBar(),
      ),
    );
  }
}
