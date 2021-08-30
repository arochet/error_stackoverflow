import 'package:base_de_projet/domain/game/statistiques.dart';
import 'package:base_de_projet/presentation/components/bar_of_success.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountStatistic extends ConsumerWidget {
  final double heightAppBar;
  const AccountStatistic({Key? key, required this.heightAppBar})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final streamS = watch(statistiquesCurrentUser);
    return streamS.when(
      data: (stats) {
        stats = stats ?? Statistiques.empty();
        final pourcentageSuccess =
            (stats.nbGame != 0 ? stats.nbSuccess / stats.nbGame : 0) * 100;
        final pourcentageDefeat =
            (stats.nbGame != 0 ? stats.nbDefeat / stats.nbGame : 0) * 100;
        return ListView(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${stats.nbGame * 5} points",
                  style: Theme.of(context).textTheme.headline2),
            ),
            SizedBox(height: 20),
            Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      //NOMBRE DE PARTIES
                      Text(
                        "${stats.nbGame} Parties",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: 20),
                      //VICTOIRE / DEFAITES
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${stats.nbSuccess} victoires",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.green)),
                          Text("${stats.nbDefeat} défaites",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.red)),
                        ],
                      ),
                      //BARRE DE RATIO
                      BarOfSuccess(),
                      //POURCENTAGE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$pourcentageSuccess%",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.green)),
                          Text("$pourcentageDefeat%",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.red)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text(err.toString())),
    );
  }
}
