import 'package:flutter/material.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/app.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    PageController drawerController = App.pageController;
    return Drawer(
      child: Container(
        color: MyColors.darkGrey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(child: Image.asset('assets/icon_transparent.png')),
              decoration: BoxDecoration(
                color: MyColors.grey,
              ),
            ),
            ListTile(
              title: textNormal('Leaderboards', MyColors.lightGrey, 20),
              leading: Icon(Icons.assessment, color: MyColors.orange),
              onTap: () {
                Navigator.pop(context);
                drawerController.jumpToPage(1);
              },
            ),
            ListTile(
              title: textNormal('News', MyColors.lightGrey, 20),
              leading: Icon(Icons.art_track, color: MyColors.orange),
              onTap: () {
                Navigator.pop(context);
                drawerController.jumpToPage(0);
              },
            ),
            ListTile(
              title: textNormal('Wiki', MyColors.lightGrey, 20),
              leading: Icon(Icons.account_box, color: MyColors.orange,),
              onTap: () {
                Navigator.pop(context);
                drawerController.jumpToPage(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
