import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:flutter/material.dart';

class ChooseTeamPage extends StatelessWidget {
  const ChooseTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWithAppbar(
        appbar: ChooseTeamAppbar(),
        backgroundColorAppbar: blueMarineColor,
        heightAppBar: 160,
        body: ChooseTeamBody(),
        bottombar: ChooseTeamBottombar(),
        heightBottomBar: 200,
      ),
    );
  }
}

class ChooseTeamBottombar extends StatelessWidget {
  const ChooseTeamBottombar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.gameCurrent);
            },
            child: _buildAvatarTeam(context, true),
          ),
          SizedBox(width: 40),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.gameCurrent);
            },
            child: _buildAvatarTeam(context, false),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarTeam(BuildContext context, bool teamBlack) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 40),
        SizedBox(height: 10),
        Text(
          teamBlack ? "Noir" : "Blanc",
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}

class ChooseTeamBody extends StatelessWidget {
  const ChooseTeamBody({
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
            "Sacha",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRouter.gameChooseTeam),
            child: Container(
              width: 200,
              height: 200,
              child: Placeholder(),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Romain",
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}

class ChooseTeamAppbar extends StatelessWidget {
  const ChooseTeamAppbar({
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
