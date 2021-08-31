import 'package:flutter/material.dart';

class CurrentGameBody extends StatelessWidget {
  const CurrentGameBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Partie en cours ..",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 10),
          Container(
            width: 200,
            height: 200,
            child: Image(image: AssetImage("assets/images/plateau.png")),
          ),
        ],
      ),
    );
  }
}
