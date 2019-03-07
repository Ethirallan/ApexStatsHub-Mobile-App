import 'package:flutter/material.dart';
import 'dart:io';
import 'package:apex_stats_hub/my_colors.dart';

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
      return Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: MyColors.grey,
        ),
        child: AlertDialog(
          title: Text("Exit dialog", style: TextStyle(color: Colors.white, fontSize: 20),),
          content: Text("Do you really want to exit?", style: TextStyle(color: MyColors.lightGrey, fontSize: 18),),
          actions: <Widget>[
            FlatButton(
              child: Text("Yes", style: TextStyle(color: MyColors.orange, fontSize: 18),),
              onPressed: () {
                exit(0);
              },
            ),
            FlatButton(
              child: Text("No", style: TextStyle(color: MyColors.orange, fontSize: 18),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
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
        child: Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: MyColors.grey,
            accentColor: MyColors.orange,
          ),
          child: AlertDialog(
            title: Text("Loading ...", style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
            content: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      );
    }
  );
}

