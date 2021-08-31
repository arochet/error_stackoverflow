import 'package:base_de_projet/presentation/account/account/widget/account_appbar.dart';
import 'package:base_de_projet/presentation/account/account/widget/account_info.dart';
import 'package:base_de_projet/presentation/account/account/widget/account_statistic.dart';
import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final seletedIndexProvider = StateProvider<int>((ref) => 0);

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightAppBar = 200;
    return PageWithAppbar(
      appbar: AppBarAccount(),
      heightAppBar: heightAppBar,
      body: Container(
        color: backgroundColor,
        child: Consumer(builder: (context, watch, child) {
          final index = watch(seletedIndexProvider);
          if (index.state == 0)
            return Container(
              child: AccountStatistic(
                heightAppBar: heightAppBar,
                key: UniqueKey(),
              ),
            );
          else
            return Container(
              child: AccountInfo(
                key: UniqueKey(),
              ),
            );
        }),
      ),
    );
  }
}
