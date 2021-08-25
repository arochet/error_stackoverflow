import 'package:flutter/material.dart';
import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/presentation/account/account/widget/card_show_info.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountInfo extends StatelessWidget {
  final double heightAppBar;
  const AccountInfo({Key? key, required this.heightAppBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      AsyncValue<UserData?> user = watch(currentUserData);
      //Récupère les données utilisateurs (Informations personnelles)
      return user.when(
        data: (data) {
          String firstName = "";
          String name = "";
          String nameUser = "";
          String phone = "";
          String email = "";
          if (data != null) {
            firstName = data.firstName.getOrCrash();
            name = data.name.getOrCrash();
            nameUser = data.userName.getOrCrash();
            phone = data.phone.getOrCrash();
            email = data.email.getOrCrash();
          }

          //Container Informations personnelles
          return ListView(
            children: <Widget>[
              SizedBox(height: heightAppBar),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: Text("Informations Personnelles",
                    style: Theme.of(context).textTheme.headline5),
              ),
              CardShowInfo(title: "Prénom", body: firstName),
              CardShowInfo(title: "Nom", body: name),
              CardShowInfo(title: "Nom d'utilisateur", body: nameUser),
              CardShowInfo(title: "Téléphone", body: phone),
              CardShowInfo(title: "Adresse Email", body: email),
              SizedBox(height: 10),
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.modifyAccount);
                  },
                  style: buttonPrimaryNormal,
                  child: const Text('Modifier'),
                ),
              ),
            ],
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (err, stack) => Text("Error : $err"),
      );
    });
  }
}
