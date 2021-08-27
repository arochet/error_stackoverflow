import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaitPlayerPage extends StatelessWidget {
  const WaitPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWithAppbar(
        backgroundColorAppbar: blueMarineColor,
        appbar: WaitPlayerAppbar(),
        body: WaitPlayerBody(),
        heightAppBar: 160,
      ),
    );
  }
}

class WaitPlayerBody extends StatelessWidget {
  const WaitPlayerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "En l'attente de l'autre joueur...",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.gameChooseTeam);
            },
            child: Container(
              color: Colors.black12,
              width: 200,
              height: 200,
              child: Placeholder(),
            ),
          ),
          SizedBox(height: 20),
          Consumer(builder: (context, watch, _) {
            final userData = watch(currentUserData);
            if (userData.data != null && userData.data!.value != null) {
              //Value okay
              return Column(
                children: [
                  Text(
                    userData.data!.value!.userName.getOrCrash(),
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text("1335", style: Theme.of(context).textTheme.headline5),
                ],
              );
            } else {
              //Value Null !
              return Column(
                children: [
                  Text("", style: Theme.of(context).textTheme.headline3),
                  Text("", style: Theme.of(context).textTheme.headline5),
                ],
              );
            }
          }),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, AppRouter.home),
            child: Text("Quitter"),
            style: buttonPrimaryNormal,
          )
        ],
      ),
    );
  }
}

class WaitPlayerAppbar extends StatelessWidget {
  const WaitPlayerAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Table 12",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
