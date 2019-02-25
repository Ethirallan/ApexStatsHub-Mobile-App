import 'package:flutter/material.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/my_drawer.dart';

class Guides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: MyColors.lightGrey),
        backgroundColor: MyColors.grey,
        title: textNormal('Guides', MyColors.lightGrey, 20),
      ),
      body: Container(
        color: MyColors.darkGrey,
      ),
      drawer: MyDrawer(),
    );
  }
}
