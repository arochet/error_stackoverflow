import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/game/game_notifier.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

final qrCodeOkay = StateProvider((ref) => false);

class ScanQrCodeBody extends StatelessWidget {
  const ScanQrCodeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProviderListener(
          provider: gameNotifierProvider,
          onChange: (context, MyCurrentGameData myCurrentGameData) {
            myCurrentGameData.idGameFailureOrSuccessOption.fold(
                () {},
                (either) => either.fold((failure) {
                      context.read(qrCodeOkay).state = false;
                      //Message d'erreur
                      Flushbar(
                        duration: const Duration(seconds: 3),
                        icon: const Icon(Icons.warning),
                        messageColor: Colors.red,
                        message: failure.map(
                          noInternet: (_) => 'Pas d\'internet',
                          serverError: (_) => 'Server Error',
                          userAlreadyCreatedGame: (_) =>
                              'Vous avez déjà créé une partie',
                        ),
                      ).show(context);
                    }, (_id) {
                      Future.delayed(Duration.zero, () async {
                        context.read(qrCodeOkay).state = true;
                        context.read(uniqueIdCurrentGameProvider).state = _id;
                        Navigator.pushNamed(context, AppRouter.gameWaitPlayer);
                      });
                    }));
          },
          child: QRCode(),
        ),
        /* ElevatedButton.icon(
            onPressed: () =>
                context.read(gameNotifierProvider.notifier).newGame("Table-10"),
            icon: Icon(Icons.qr_code),
            label: Text("Go")), */
        Center(
            heightFactor: 7,
            child: Text(
              "Scanner votre table avec votre adversaire",
              style: Theme.of(context).textTheme.headline5,
            )),
      ],
    );
  }
}

class QRCode extends StatefulWidget {
  const QRCode({Key? key}) : super(key: key);

  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        if (context.read(qrCodeOkay).state == false) {
          result = scanData;
          final code = result?.code;
          if (code != null) {
            context.read(qrCodeOkay).state = true;
            context.read(gameNotifierProvider.notifier).newGame(code);
          }
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
