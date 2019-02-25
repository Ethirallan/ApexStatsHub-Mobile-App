import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/scoped_models/scoped_player_info.dart';
import 'package:apex_stats_hub/my_drawer.dart';
import 'package:apex_stats_hub/models/player_data.dart';
import 'package:apex_stats_hub/pages/leaderboards/player_stats.dart';
import 'package:apex_stats_hub/pages/leaderboards/apex_player_search_bar.dart';

class LeaderBoards extends StatelessWidget {
  final ScopedPlayerInfo scopedPlayerInfo = new ScopedPlayerInfo();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ScopedPlayerInfo>(
      model: scopedPlayerInfo,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: MyColors.lightGrey),
          backgroundColor: MyColors.grey,
          title: textNormal('Leaderboards', MyColors.lightGrey, 20),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: MyColors.darkGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ApexPlayerSearchBar(
                  searchBarCtrl: scopedPlayerInfo.searchPlayerCtrl,
                  arrowFunction: () async {
                    var data = await PlayerData().getPlayerData(scopedPlayerInfo.searchPlayerCtrl.text);
                    scopedPlayerInfo.setData(data);
                  },
                ),
                PlayerStats(),
              ],
            ),
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
