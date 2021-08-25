import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/presentation/account/account/widget/account_appbar.dart';
import 'package:base_de_projet/presentation/account/account/widget/card_show_info.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    //Rafraichit les données utilisateur lors de l'initialisation
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => context.refresh(currentUserData));
  }

  @override
  Widget build(BuildContext context) {
    double heightAppBar = 200;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              color: backgroundColor,
              child: AccountInfo(heightAppBar: heightAppBar),
            ),
            Positioned(
              top: -10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: heightAppBar,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 17,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: AppBarAccount(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
