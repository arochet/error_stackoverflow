import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../account_page.dart';

class AppBarAccount extends StatefulWidget {
  const AppBarAccount({Key? key}) : super(key: key);

  @override
  _AppBarAccountState createState() => _AppBarAccountState();
}

class _AppBarAccountState extends State<AppBarAccount> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text(
            "Romain",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 5),
          //AVATAR
          CircleAvatar(
            minRadius: 40,
          ),
          Expanded(child: Container()),
          Container(
            height: 30,
            child: Consumer(builder: (context, watch, _) {
              final index = watch(seletedIndexProvider);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: _buildNavigationBarItem(
                        context, "Statistiques", index.state == 0),
                    onTap: () => setState(
                        () => context.read(seletedIndexProvider).state = 0),
                  ),
                  GestureDetector(
                    child: _buildNavigationBarItem(
                        context, "Données", index.state == 1),
                    onTap: () => setState(
                        () => context.read(seletedIndexProvider).state = 1),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _buildNavigationBarItem(
      BuildContext context, String title, bool selected) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        Expanded(child: Container()),
        if (selected)
          Container(
            width: 50,
            height: 3,
            color: Colors.black,
          ),
      ],
    );
  }
}
