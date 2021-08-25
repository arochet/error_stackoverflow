import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/home/widget/home_appbar.dart';
import 'package:base_de_projet/presentation/home/widget/home_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWithAppbar(
      heightAppBar: 100,
      child: HomeBody(heightAppBar: 100),
      appbar: AppBarHome(),
    );
  }
}
