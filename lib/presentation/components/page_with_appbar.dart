import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:flutter/material.dart';

class PageWithAppbar extends StatelessWidget {
  final Widget body;
  final Widget appbar;
  final double heightAppBar;
  final Color? backgroundColorAppbar;
  final Widget? bottombar;
  final double? heightBottomBar;
  final Color? backgroundColorBottombar;
  final Widget? customBottomBar;
  const PageWithAppbar({
    Key? key,
    required this.body,
    required this.appbar,
    required this.heightAppBar,
    this.backgroundColorAppbar,
    this.bottombar,
    this.backgroundColorBottombar,
    this.heightBottomBar,
    this.customBottomBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          backgroundColorAppbar == null ? Colors.white : backgroundColorAppbar,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            //BODY
            Container(
              color: backgroundColor,
              child: Column(
                children: [
                  SizedBox(height: heightAppBar - 20),
                  Expanded(child: body),
                  SizedBox(
                    height: heightBottomBar == null ? 0 : heightBottomBar! - 10,
                  ),
                ],
              ),
            ),
            //APPBAR
            Positioned(
              top: -10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: heightAppBar,
                decoration: BoxDecoration(
                  color: backgroundColorAppbar == null
                      ? Colors.white
                      : backgroundColorAppbar,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 17,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: appbar,
              ),
            ),
            //BOTTOM BAR
            if (bottombar != null) ...[
              Positioned(
                bottom: -10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: heightBottomBar == null ? 150 : heightBottomBar,
                  decoration: BoxDecoration(
                    color: backgroundColorBottombar == null
                        ? Colors.white
                        : backgroundColorBottombar,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 17,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: bottombar,
                ),
              ),
            ] else if (customBottomBar != null) ...[
              customBottomBar!
            ],
          ],
        ),
      ),
    );
  }
}
