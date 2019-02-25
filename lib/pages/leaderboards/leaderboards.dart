import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/scoped_models/scoped_player_info.dart';
import 'package:apex_stats_hub/my_drawer.dart';
import 'package:apex_stats_hub/models/player_data.dart';

class LeaderBoards extends StatelessWidget {
  final ScopedPlayerInfo scopedPlayerInfo = new ScopedPlayerInfo();
  final TextEditingController searchPlayerCtrl = new TextEditingController();
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
        body: Container(
          color: MyColors.darkGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ApexPlayerSearchBar(
                searchBarCtrl: searchPlayerCtrl,
                arrowFunction: () async {
                  var data = await PlayerData().getPlayerData(searchPlayerCtrl.text);
                  scopedPlayerInfo.setData(data);
                },
              ),
              ScopedModelDescendant<ScopedPlayerInfo>(
                builder: (context, child, model) {
                  if (model.playerData.name == null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top:250),
                          child: textBold('No results', MyColors.lightGrey, 24),
                        ),
                        textNormal('Type in a name and try again', MyColors.lightGrey, 18),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        textNormal(model.playerData.name, MyColors.orange, 20),
                        textNormal(model.playerData.kills, MyColors.lightGrey, 20),
                        textNormal(model.playerData.globalrank, MyColors.lightGrey, 20)
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
