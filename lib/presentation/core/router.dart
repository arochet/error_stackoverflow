class AppRouter {
  static get defaultPath => "/";
  static get signIn => "/sign-in";
  static get authInit => "/auth-init";
  static get authConnexion => "/auth-connexion";
  static get authRegister => "/auth-register";
  static get authCheckEmail => "/auth-check-email";
  static get authResetPassword => "/auth-reset-password";
  static get home => "/home";
  static get modifyAccount => "/modify-account";
  static get reauthenticate => "/reauthenticate";
  static get deleteAccount => "/delete-account";
  static get newPassword => "/new-password";
  static get gameScanQrCode => "/game-scan-qrcode";
  static get gameWaitPlayer => "/game-wait-player";
  static get gameChooseTeam => "/game-choose-team";
  static get gameCurrent => "/game-current";
  static get gameWinner => "/game-winner";
}
