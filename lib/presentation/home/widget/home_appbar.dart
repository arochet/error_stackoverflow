import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/presentation/components/avatar.dart';
import 'package:base_de_projet/presentation/components/bar_of_success.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //AVATAR
          AvatarWidget(size: 30),
          SizedBox(
            width: 20,
          ),
          Consumer(builder: (context, watch, child) {
            final userData = watch(currentUserData);
            final stats = watch(statistiquesCurrentUser);
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  //Nom du joueur - Score
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getUserName(context, userData),
                      Text(
                        stats.when(
                          data: (s) => s?.score.toString() ?? '',
                          loading: () => '',
                          error: (err, stack) => err.toString(),
                        ),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ),
                BarOfSuccess(width: 150),
                SizedBox(
                  height: 10,
                )
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget getUserName(BuildContext context, AsyncValue<UserData?> userData) {
    if (userData.data != null && userData.data!.value != null) {
      return Text(
        userData.data!.value!.userName.getOrCrash(),
        style: Theme.of(context).textTheme.headline4,
      );
    } else {
      return Text(
        "_",
        style: Theme.of(context).textTheme.headline4,
      );
    }
  }
}
