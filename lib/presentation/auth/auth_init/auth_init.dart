import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:flutter/material.dart';

class AuthInitPage extends StatelessWidget {
  const AuthInitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomPaint(
              size: Size(0, 0),
              painter: BackgroundRoundPaint(MediaQuery.of(context).size.width),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Base de projet",
                      style: Theme.of(context).textTheme.headline2),
                  SizedBox(height: 20),
                  Image(
                    image: AssetImage("assets/chess.png"),
                    height: 120,
                  ),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Container(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRouter.authConnexion);
                          },
                          style: buttonMain,
                          child: const Text('Se Connecter'),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRouter.authRegister);
                          },
                          style: buttonSecondary,
                          child: const Text("S'inscrire"),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}