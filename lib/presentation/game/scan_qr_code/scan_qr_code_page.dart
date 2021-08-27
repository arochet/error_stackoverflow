import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/game/scan_qr_code/widget/scan_qr_code_appbar.dart';
import 'package:base_de_projet/presentation/game/scan_qr_code/widget/scan_qr_code_body.dart';
import 'package:flutter/material.dart';

class ScanQrCodePage extends StatelessWidget {
  const ScanQrCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWithAppbar(
        appbar: ScanQrCodeAppbar(),
        backgroundColorAppbar: blueMarineColor,
        heightAppBar: 210,
        body: ScanQrCodeBody(),
      ),
    );
  }
}
