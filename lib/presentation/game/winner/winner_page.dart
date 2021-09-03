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
                //MODAL DE CONFIRMATION
                Widget cancelButton = TextButton(
                  child: Text("Annuler",
                      style: Theme.of(context).textTheme.button),
                  onPressed: () => Navigator.of(context).pop(),
                );
                Widget continueButton = TextButton(
                  child: Text("Supprimer la partie",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.red)),
                  onPressed: () async {
                    final idGame = context.read(uniqueIdCurrentGameProvider);
                    if (idGame.state != null)
                      await context
                          .read(gameRepositoryProvider)
                          .cancelGame(idGame.state!);
                    Navigator.pushReplacementNamed(context, AppRouter.home);
                  },
                );

                // set up the AlertDialog
                AlertDialog alert = AlertDialog(
                  title: Text("Attention !"),
                  content: Text("Etes-vous sur de vouloir annuler la partie ?"),
                  actions: [
                    cancelButton,
                    continueButton,
                  ],
                );

                // show the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
              child: Text("Annuler la partie"),
              style: buttonPrimaryNormal,
            ),
            SizedBox(height: 50),
          ],
        ),
        customBottomBar: WinnerBottomBar(),
      ),
    );
  }
}
