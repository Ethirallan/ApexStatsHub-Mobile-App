import 'package:flutter/material.dart';
import 'dart:io';

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

Future<bool> onExitDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Exit dialog"),
        content: Text("Do you really want to exit?"),
        actions: <Widget>[
          FlatButton(
            child: Text("Yes"),
            onPressed: () {
              exit(0);
            },
          ),
          FlatButton(
            child: Text("No"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  ) ?? false;
}

void loadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text("Loading ..."),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
  );
}

