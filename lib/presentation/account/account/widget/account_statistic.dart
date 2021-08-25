import 'package:flutter/material.dart';

class AccountStatistic extends StatelessWidget {
  final double heightAppBar;
  const AccountStatistic({Key? key, required this.heightAppBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: heightAppBar + 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text("1350 points", style: Theme.of(context).textTheme.headline2),
        ),
        SizedBox(height: 20),
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  //NOMBRE DE PARTIES
                  Text(
                    "165 Parties",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 20),
                  //VICTOIRE / DEFAITES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("128 victoires",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.green)),
                      Text("31 défaites",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.red)),
                    ],
                  ),
                  //BARRE DE RATIO
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                  //POURCENTAGE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("80,5%",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.green)),
                      Text("19,5%",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.red)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
