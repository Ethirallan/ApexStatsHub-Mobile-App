import 'package:flutter/material.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/custom_widgets.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: MyColors.darkGrey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: textNormal('My Profile', MyColors.orange, 20),
              decoration: BoxDecoration(
                color: MyColors.grey,
              ),
            ),
            ListTile(
              title: textNormal('Leaderboards', MyColors.lightGrey, 20),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: textNormal('News', MyColors.lightGrey, 20),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/news');
              },
            ),
            ListTile(
              title: textNormal('Guides', MyColors.lightGrey, 20),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/guides');
              },
            ),
            ListTile(
              title: textNormal('Wiki', MyColors.lightGrey, 20),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/wiki');
              },
            ),
            ListTile(
              title: textNormal('Streams', MyColors.lightGrey, 20),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/streams');
              },
            ),
          ],
        ),
      ),
    );
  }
}
