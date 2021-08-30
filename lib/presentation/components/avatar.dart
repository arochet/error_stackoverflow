import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvatarWidget extends ConsumerWidget {
  final double size;
  const AvatarWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final img = watch(currentPhotoProfile);
    return img.when(
      data: (img) {
        if (img == null)
          return CircleAvatar(
            radius: size,
            backgroundImage: AssetImage("assets/icon/noavatar.png"),
          );
        else
          return CircleAvatar(
            radius: size,
            backgroundImage: img.image,
          );
      },
      loading: () => CircularProgressIndicator(),
      error: (e, s) => CircleAvatar(radius: size),
    );
  }
}

class AvatarPlayerWidget extends ConsumerWidget {
  final double size;
  final idPlayer;
  const AvatarPlayerWidget(
      {Key? key, required this.size, required this.idPlayer})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final img = watch(playerPhotoProfile(idPlayer));
    return img.when(
      data: (img) {
        if (img == null)
          return CircleAvatar(
            radius: size,
            backgroundImage: AssetImage("assets/icon/noavatar.png"),
          );
        else
          return CircleAvatar(
            radius: size,
            backgroundImage: img.image,
          );
      },
      loading: () => CircularProgressIndicator(),
      error: (e, s) => CircleAvatar(radius: size),
    );
  }
}
