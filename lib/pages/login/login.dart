import 'package:flutter/material.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/my_colors.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: MyColors.lightGrey),
        backgroundColor: MyColors.grey,
        title: textNormal('Login', MyColors.lightGrey, 20),
      ),
      body: Container(
        color: MyColors.darkGrey,
      ),
    );
  }
}
