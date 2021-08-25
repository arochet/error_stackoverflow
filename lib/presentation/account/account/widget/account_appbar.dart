import 'package:flutter/material.dart';

class AppBarAccount extends StatelessWidget {
  const AppBarAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            "Romain",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 5),
          //AVATAR
          CircleAvatar(
            minRadius: 40,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
