import 'package:base_de_projet/domain/game/statistiques.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BarOfSuccess extends ConsumerWidget {
  final double? width;
  const BarOfSuccess({
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final streamS = watch(statistiquesCurrentUser);
    return streamS.when(
      data: (stat) {
        stat = stat ?? Statistiques.empty();
        double ratio =
            stat.nbGame != 0 ? (stat.nbSuccess / stat.nbGame).toDouble() : 1;
        return _buildLinearBar(ratio, false);
      },
      loading: () => _buildLinearBar(0.5, false),
      error: (err, stack) => Text(err.toString()),
    );
  }

  _buildLinearBar(double ratio, bool isLoading) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: width,
      height: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: LinearProgressIndicator(
          value: ratio,
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
          backgroundColor: isLoading ? Colors.grey : Colors.red,
        ),
      ),
    );
  }
}
