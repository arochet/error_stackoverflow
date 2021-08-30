import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/home/widget/home_appbar.dart';
import 'package:base_de_projet/presentation/home/widget/home_body.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.refresh(statistiquesCurrentUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageWithAppbar(
      heightAppBar: 100,
      body: HomeBody(),
      appbar: AppBarHome(),
    );
  }
}
