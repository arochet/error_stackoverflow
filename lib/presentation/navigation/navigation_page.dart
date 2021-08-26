import 'package:base_de_projet/presentation/account/account/account_page.dart';
import 'package:base_de_projet/presentation/auth/widget/check_connexion_widget.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class NavigationArguments {
  final int indexNavigationBar;
  NavigationArguments(this.indexNavigationBar);
}

final GlobalKey<ScaffoldState> scaffoldKeyMain = GlobalKey<ScaffoldState>();

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Center(child: AccountPage()),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final args =
          ModalRoute.of(context)!.settings.arguments as NavigationArguments?;
      final index = args != null ? args.indexNavigationBar : 0;
      _onItemTapped(index);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckConnexionWidget(
      child: Scaffold(
        key: scaffoldKeyMain,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: buildIcon(Icons.home, false),
              label: '_________',
              activeIcon: buildIcon(Icons.home, true),
            ),
            BottomNavigationBarItem(
              icon: buildIcon(Icons.account_circle, false),
              label: '_________',
              activeIcon: buildIcon(Icons.account_circle, true),
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: greenColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedFontSize: 3.0,
          unselectedFontSize: 3.0,
          iconSize: 35,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget buildIcon(IconData ic, bool selected) {
    return Column(
      children: [
        Icon(ic),
        if (selected)
          Container(
            width: 20,
            height: 3,
            color: greenColor,
          ),
      ],
    );
  }
}
