import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextTableWidget extends StatelessWidget {
  const TextTableWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      final streamG = watch(currentGameProvider);
      return streamG.when(
        data: (game) => Text(
          game != null ? game.idTable.getOrCrash() : '',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
        loading: () => CircularProgressIndicator(),
        error: (Object error, StackTrace? stackTrace) => Text("Error"),
      );
    });
  }
}
