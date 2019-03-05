import 'package:flutter/material.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/my_drawer.dart';
import 'package:apex_stats_hub/pages/guides/all_guides.dart';
import 'package:apex_stats_hub/pages/guides/gameplay_guides.dart';
import 'package:apex_stats_hub/pages/guides/weapons_guides.dart';
import 'package:apex_stats_hub/pages/guides/characters_guides.dart';

class Guides extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: MyColors.lightGrey),
          backgroundColor: MyColors.grey,
          title: textNormal('Guides', MyColors.lightGrey, 20),
        ),
        body: TabBarView(
          children: <Widget>[
            AllGuides(),
            GameplayGuides(),
            CharactersGuides(),
            WeaponsGuides(),
          ],
        ),
        drawer: MyDrawer(),
        bottomNavigationBar: Material(
          color: MyColors.grey,
          child: TabBar(
            labelColor: MyColors.lightGrey,
            unselectedLabelColor: MyColors.lightGrey,
            indicatorColor: MyColors.orange,
            tabs: <Widget>[
              Tab(
                child: Text('All', style: TextStyle(fontSize: 20),),
              ),
              Tab(
                child: Text('Gameplay', style: TextStyle(fontSize: 20),),
              ),
              Tab(
                child: Text('Characters', style: TextStyle(fontSize: 20),),
              ),
              Tab(
                child: Text('Weapons', style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

