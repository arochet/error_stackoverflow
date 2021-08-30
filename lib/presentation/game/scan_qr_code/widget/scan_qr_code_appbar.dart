import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:flutter/material.dart';

class ScanQrCodeAppbar extends StatelessWidget {
  const ScanQrCodeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 35,
          top: 60,
          child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/chess2.jpeg'),
              radius: 55),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                ),
                label: Container(),
                style: buttonBack,
              ),
              SizedBox(height: 10),
              Text(
                "Vous êtes arrivés ?",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                "Blitz est ravis de vous revoir.",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: greyClearColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
