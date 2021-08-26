import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:flutter/material.dart';

class PageWithAppbar extends StatelessWidget {
  final Widget body;
  final Widget appbar;
  final double heightAppBar;
  final Color? backgroundColorAppbar;
  const PageWithAppbar(
      {Key? key,
      required this.body,
      required this.appbar,
      required this.heightAppBar,
      this.backgroundColorAppbar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          backgroundColorAppbar == null ? Colors.white : backgroundColorAppbar,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              color: backgroundColor,
              child: body,
            ),
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
          ],
        ),
      ),
    );
  }
}
