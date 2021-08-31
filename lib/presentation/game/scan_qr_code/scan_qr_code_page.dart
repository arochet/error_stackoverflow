import 'package:base_de_projet/presentation/components/page_with_appbar.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/game/scan_qr_code/widget/scan_qr_code_appbar.dart';
import 'package:base_de_projet/presentation/game/scan_qr_code/widget/scan_qr_code_body.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanQrCodePage extends StatefulWidget {
  const ScanQrCodePage({Key? key}) : super(key: key);

  @override
  State<ScanQrCodePage> createState() => _ScanQrCodePageState();
}

class _ScanQrCodePageState extends State<ScanQrCodePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await context.read(gameNotifierProvider.notifier).reinit();
      context.refresh(gameNotifierProvider);
      context.read(qrCodeOkay).state = false;
    });
  }

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
