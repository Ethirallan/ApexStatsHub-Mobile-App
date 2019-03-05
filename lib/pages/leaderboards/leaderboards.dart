import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/scoped_models/scoped_player_info.dart';
import 'package:apex_stats_hub/my_drawer.dart';
import 'package:apex_stats_hub/models/player_data_http.dart';
import 'package:apex_stats_hub/pages/leaderboards/player_stats.dart';
import 'package:apex_stats_hub/pages/leaderboards/apex_player_search_bar.dart';

class LeaderBoards extends StatefulWidget {
  @override
  LeaderBoardsState createState() {
    return new LeaderBoardsState();
  }
}

class LeaderBoardsState extends State<LeaderBoards> {
  static final ScopedPlayerInfo scopedPlayerInfo = new ScopedPlayerInfo();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onExitDialog(context);
      },
      child: ScopedModel<ScopedPlayerInfo>(
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
                  ScopedModelDescendant<ScopedPlayerInfo>(
                    builder: (context, child, model) {
                      return ApexPlayerSearchBar(
                        context: context,
                        searchBarCtrl: scopedPlayerInfo.searchPlayerCtrl,
                        arrowFunction: () async {
                          if (scopedPlayerInfo.searchPlayerCtrl.text != '') {
                            await searchForPlayer();
                          }
                        },
                      );
                    },
                  ),
                  PlayerStats(),
                ],
              ),
            ),
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }

  Future searchForPlayer() async {
    if (context != null) {
      FocusScope.of(context).requestFocus(new FocusNode());
    }
    loadingDialog(context);
    var data = await getPlayerData(scopedPlayerInfo.searchPlayerCtrl.text);
    if (data != null) {
      scopedPlayerInfo.setData(data);
    }
    Navigator.pop(context);
  }
}
