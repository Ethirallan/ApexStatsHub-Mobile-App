import 'package:flutter/material.dart';


Widget textNormal(String text, Color color, double size, {TextAlign textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget textBold(String text, Color color, double size, {TextAlign textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
  );
}


//With padding on left side
Widget textNormalAlignRight(String text, Color color, double size) {
  return Text(
    text,
    textAlign: TextAlign.end,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.normal,
    ),
  );
}


