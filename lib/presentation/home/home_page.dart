import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/home/widget/home_appbar.dart';
import 'package:base_de_projet/presentation/home/widget/home_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightAppBar = 100;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              color: backgroundColor,
              child: HomeBody(heightAppBar: heightAppBar),
            ),
            Positioned(
              top: -10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: heightAppBar,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                child: AppBarHome(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
