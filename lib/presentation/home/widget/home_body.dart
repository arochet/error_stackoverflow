import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightBetweenPanel = 10;
    return ListView(
      children: <Widget>[
        SizedBox(height: heightBetweenPanel + 10),
        //PANEL JOUER
        PanelPlay(),
        SizedBox(height: heightBetweenPanel),
        //PANEL EVENEMENT
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child:
              Text("Evénements", style: Theme.of(context).textTheme.headline3),
        ),
        SizedBox(height: heightBetweenPanel),
        Evenement(),
        SizedBox(height: heightBetweenPanel),
        //PANEL RESERVATION
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child:
              Text("Réservation", style: Theme.of(context).textTheme.headline3),
        ),
        SizedBox(height: heightBetweenPanel),
        Reservation(),
        SizedBox(height: heightBetweenPanel),
      ],
    );
  }
}

//CATEGORIE
class Evenement extends StatelessWidget {
  const Evenement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          PanelTournoiSimultanee(),
          PanelTitleAndSubtitle(
            title: "Tournois",
            subtitle: "Hebdomadaire",
            backgroundImage: "assets/images/chess1.jpeg",
            color: greenClearColor,
          ),
        ],
      ),
    );
  }
}

class Reservation extends StatelessWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          PanelBigTitle(
            title: "Réserver une table",
            backgroundImage: "assets/images/chess2.jpeg",
            color: greenClearColor,
          ),
          PanelBigTitle(
            title: "Cours Collectifs",
            backgroundImage: "assets/images/chess3.jpeg",
            color: blueColor,
          ),
        ],
      ),
    );
  }
}

//PANEL BASE
class RoundedPanel extends StatelessWidget {
  final Widget child;
  final Color color;
  const RoundedPanel({Key? key, required this.child, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 9.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          child: child,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class DefaultPanel extends StatelessWidget {
  final Widget child;
  final String backgroundImage;
  final Color color;
  const DefaultPanel(
      {Key? key,
      required this.child,
      required this.backgroundImage,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedPanel(
      child: Container(
        width: MediaQuery.of(context).size.width - 80,
        child: Stack(children: [
          //Background Image
          Positioned(
              top: -30,
              right: -60,
              child: CircleAvatar(
                backgroundImage: AssetImage(backgroundImage),
                radius: 120,
              )),
          //Front
          child
        ]),
      ),
      color: color,
    );
  }
}

class PanelPlay extends StatelessWidget {
  const PanelPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRouter.gameScanQrCode),
      child: RoundedPanel(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vous êtes au club ?",
                    style: txtStyleSubtitleGrey,
                  ),
                  Text(
                    "Jouer",
                    style: txtStyleTitleWhite,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
                child: CircleAvatar(
                  radius: 36,
                  foregroundImage: AssetImage("assets/images/chess1.jpeg"),
                ),
              ),
            ],
          ),
        ),
        color: Color.fromRGBO(29, 51, 82, 1),
      ),
    );
  }
}

//PANEL FRONT
class PanelBigTitle extends StatelessWidget {
  final String title;
  final String backgroundImage;
  final Color color;
  const PanelBigTitle(
      {Key? key,
      required this.title,
      required this.backgroundImage,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPanel(
      child: Positioned(
        bottom: 20,
        left: 20,
        child: Container(
          width: 200,
          child: Text(
            title,
            style: txtStyleTitleWhite,
          ),
        ),
      ),
      backgroundImage: backgroundImage,
      color: color,
    );
  }
}

class PanelTitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final String backgroundImage;
  final Color color;
  const PanelTitleAndSubtitle(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.backgroundImage,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPanel(
      child: Positioned(
        bottom: 20,
        left: 20,
        child: Container(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: txtStyleTitleWhite,
              ),
              Text(
                subtitle,
                style: txtStyleSubtitleWhite,
              ),
            ],
          ),
        ),
      ),
      backgroundImage: backgroundImage,
      color: color,
    );
  }
}

class PanelTournoiSimultanee extends StatelessWidget {
  const PanelTournoiSimultanee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPanel(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Simultanée", style: txtStyleTitleWhite),
            Text("Tournois", style: txtStyleSubtitleWhite),
            Text("Le 26 octobre de 10h à 18h.\n Prix d'entrée 60€",
                textAlign: TextAlign.center, style: txtStyleBodyWhite),
            ElevatedButton(
              onPressed: () {},
              child: Text("Participer"),
              style: buttonTertiaryNormal,
            )
          ],
        ),
      ),
      backgroundImage: "assets/images/chess1.jpeg",
      color: greenColor,
    );
  }
}
