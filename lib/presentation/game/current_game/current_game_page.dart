import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:flutter/material.dart';

class CurrentGamePage extends StatelessWidget {
  const CurrentGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWithAppbar(
        body: Placeholder(), appbar: Container(), heightAppBar: 100);
  }
}
