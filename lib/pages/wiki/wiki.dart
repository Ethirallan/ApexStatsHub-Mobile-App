import 'package:flutter/material.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/my_drawer.dart';
import 'package:apex_stats_hub/pages/wiki/legends_fragment.dart';
import 'package:apex_stats_hub/pages/wiki/weapons_fragment.dart';

class Wiki extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: MyColors.lightGrey),
          backgroundColor: MyColors.grey,
          title: textNormal('Wiki', MyColors.lightGrey, 20),
        ),
        body: TabBarView(
          children: <Widget>[
            LegendsFragment(),
            WeaponsFragment(),
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
                child: Text('Legends', style: TextStyle(fontSize: 20),),
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
