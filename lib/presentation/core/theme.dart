import 'package:flutter/material.dart';

//BUTTON
final buttonPrimaryBig = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    visualDensity: VisualDensity(
      horizontal: (VisualDensity.maximumDensity - 1.0),
      vertical: (VisualDensity.maximumDensity - 2.0),
    ),
    minimumSize: Size(double.infinity, 30),
    primary: Color.fromARGB(255, 85, 129, 87),
    onPrimary: Colors.white,
    onSurface: Colors.grey,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0))));

final buttonSecondaryBig = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    visualDensity: VisualDensity(
      horizontal: (VisualDensity.maximumDensity - 1.0),
      vertical: (VisualDensity.maximumDensity - 4.0),
    ),
    minimumSize: Size(double.infinity, 30),
    primary: Color.fromARGB(255, 255, 255, 255),
    onPrimary: Colors.black,
    onSurface: Colors.grey,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0))));

final buttonPrimaryNormal = ElevatedButton.styleFrom(
  textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
  primary: Color.fromARGB(255, 85, 129, 87),
  onPrimary: Colors.white,
  onSurface: Colors.grey,
  elevation: 0,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0))),
);

final buttonTertiaryNormal = ElevatedButton.styleFrom(
  textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
  primary: Color.fromARGB(255, 204, 204, 204),
  onPrimary: greyColor,
  onSurface: Colors.grey,
  elevation: 0,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0))),
);

final buttonPrimaryHide = ElevatedButton.styleFrom(
  textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  primary: Colors.transparent,
  onPrimary: Colors.black54,
  elevation: 0,
);

final buttonBack = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  primary: Colors.transparent,
  onPrimary: Colors.white,
  elevation: 0,
);

//COLOR
Color backgroundColor = Color.fromRGBO(239, 239, 239, 1);
Color greenColor = Color.fromRGBO(101, 124, 91, 1);
Color greenClearColor = Color.fromRGBO(142, 164, 130, 1);
Color blueColor = Color.fromRGBO(94, 129, 162, 1);
Color blueMarineColor = Color.fromRGBO(29, 51, 83, 1);
Color greyColor = Color.fromARGB(255, 112, 112, 112);
Color greyClearColor = Color.fromRGBO(176, 183, 192, 1);

//TEXT
final txtStyleSubtitleGrey = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(164, 173, 186, 1));

final txtStyleTitleWhite =
    TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, color: Colors.white);

final txtStyleSubtitleWhite =
    TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white);
final txtStyleBodyWhite = TextStyle(
    fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white);

//AUTH INIT
class BackgroundRoundPaint extends CustomPainter {
  final double widthScreen;
  BackgroundRoundPaint(this.widthScreen);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 230, 230, 230)
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(0, -widthScreen + 100), widthScreen, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
