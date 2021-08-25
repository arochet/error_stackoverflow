import 'package:base_de_projet/presentation/account/account/widget/account_appbar.dart';
import 'package:base_de_projet/presentation/account/account/widget/account_info.dart';
import 'package:base_de_projet/presentation/account/account/widget/account_statistic.dart';
import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final seletedIndexProvider = StateProvider<int>((ref) => 0);

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
    return PageWithAppbar(
      appbar: AppBarAccount(),
      heightAppBar: heightAppBar,
      child: Container(
        color: backgroundColor,
        child: Consumer(builder: (context, watch, child) {
          final index = watch(seletedIndexProvider);
          if (index.state == 0)
            return Container(
              child: AccountStatistic(heightAppBar: heightAppBar),
            );
          else
            return AccountInfo(heightAppBar: heightAppBar);
        }),
      ),
    );
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              color: backgroundColor,
              child: Consumer(builder: (context, watch, child) {
                final index = watch(seletedIndexProvider);
                if (index.state == 0)
                  return Container(
                    child: AccountStatistic(heightAppBar: heightAppBar),
                  );
                else
                  return AccountInfo(heightAppBar: heightAppBar);
              }),
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
