import 'package:base_de_projet/presentation/account/account/account_page.dart';
import 'package:base_de_projet/presentation/auth/widget/check_connexion_widget.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class NavigationArguments {
  final int indexNavigationBar;
  NavigationArguments(this.indexNavigationBar);
}

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
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '__',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '__',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: greenColor,
          showUnselectedLabels: false,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
