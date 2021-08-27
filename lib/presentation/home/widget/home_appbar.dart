import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/presentation/components/avatar.dart';
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
                        "1335",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: 150,
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
