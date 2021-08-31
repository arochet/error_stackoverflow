import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/home/widget/home_appbar.dart';
import 'package:base_de_projet/presentation/home/widget/home_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageWithAppbar(
      heightAppBar: 100,
      body: HomeBody(),
      appbar: AppBarHome(),
    );
  }
}
