import 'package:base_de_projet/presentation/account/delete_account/delete_account_page.dart';
import 'package:base_de_projet/presentation/account/modify_account/modify_account_page.dart';
import 'package:base_de_projet/presentation/account/new_password/new_password_page.dart';
import 'package:base_de_projet/presentation/account/reathenticate/reauthenticate_page.dart';
import 'package:base_de_projet/presentation/auth/auth_check_email/auth_check_email_page.dart';
import 'package:base_de_projet/presentation/auth/auth_connexion/auth_connexion.dart';
import 'package:base_de_projet/presentation/auth/auth_init/auth_init.dart';
import 'package:base_de_projet/presentation/auth/auth_register/auth_register.dart';
import 'package:base_de_projet/presentation/auth/auth_reset_password.dart/auth_reset_password.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/game/choose_team/chosse_team_page.dart';
import 'package:base_de_projet/presentation/game/current_game/current_game_page.dart';
import 'package:base_de_projet/presentation/game/scan_qr_code/scan_qr_code_page.dart';
import 'package:base_de_projet/presentation/game/wait_player/wait_player_page.dart';
import 'package:base_de_projet/presentation/game/winner/winner_page.dart';
import 'package:base_de_projet/presentation/navigation/navigation_page.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:flutter/material.dart';
import 'package:base_de_projet/presentation/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return MaterialApp(
      title: 'Blitz Society',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Color.fromARGB(255, 230, 230, 230),
          filled: true,
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        textTheme: theme.textTheme.copyWith(
          headline1: TextStyle(
              fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline3: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline4: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline5: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline6: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.black),
        ),
      ),
      initialRoute: AppRouter.defaultPath,
      routes: {
        AppRouter.defaultPath: (context) => const SplashPage(),
        AppRouter.authInit: (context) => const AuthInitPage(),
        AppRouter.authConnexion: (context) => const AuthConnexionPage(),
        AppRouter.authRegister: (context) => const AuthRegisterPage(),
        AppRouter.authCheckEmail: (context) => const AuthCheckEmailPage(),
        AppRouter.authResetPassword: (context) => const AuthResetPasswordPage(),
        AppRouter.home: (context) => const NavigationPage(),
        AppRouter.modifyAccount: (context) => const ModifyAccountPage(),
        AppRouter.reauthenticate: (context) => const ReauthenticatePage(),
        AppRouter.deleteAccount: (context) => const DeleteAccountPage(),
        AppRouter.newPassword: (context) => const NewPasswordPage(),
        AppRouter.gameScanQrCode: (context) => const ScanQrCodePage(),
        AppRouter.gameWaitPlayer: (context) => const WaitPlayerPage(),
        AppRouter.gameChooseTeam: (context) => const ChooseTeamPage(),
        AppRouter.gameCurrent: (context) => const CurrentGamePage(),
        AppRouter.gameWinner: (context) => const WinnerPage(),
      },
    );
  }
}
