import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:apex_stats_hub/scoped_models/scoped_player_info.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/my_colors.dart';

class PlayerStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedPlayerInfo>(
      builder: (context, child, model) {
        if (model.playerData.name == null) {
          return Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top:250),
            child: Column(
              children: <Widget>[
                textBold('No results', MyColors.lightGrey, 24),
                textNormal('Type in a name and try again', MyColors.lightGrey, 18),
              ],
            ),
          );
        } else {
          return Card(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            elevation: 4,
            color: MyColors.grey,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("https://apextab.com/cache/bdbd3eba26bbf80a56288dc093257349.png")
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: textNormal(model.playerData.name, MyColors.orange, 30),
                      ),
                      Icon(Icons.laptop_windows, color: Colors.white, size: 30,)
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: textBold('OVERALL STATS', MyColors.orange, 24),
                        ),
                        statsRow(
                          textNormalAlignRight('Kills', MyColors.lightGrey, 20),
                          textNormal(model.playerData.kills, Colors.white, 20),
                        ),
                        statsRow(
                          textNormalAlignRight('Level', MyColors.lightGrey, 20),
                          textNormal(model.playerData.level, Colors.white, 20),
                        ),
                        statsRow(
                          textNormalAlignRight('Visits', MyColors.lightGrey, 20),
                          textNormal(model.playerData.visits, Colors.white, 20),
                        ),
                        statsRow(
                          textNormalAlignRight('Matches', MyColors.lightGrey, 20),
                          textNormal(model.playerData.matches, Colors.white, 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: textBold('MORE STATS', MyColors.orange, 24),
                        ),
                        statsRow(
                          textNormalAlignRight('Headshots', MyColors.lightGrey, 20),
                          textNormal(model.playerData.headshots, Colors.white, 20),
                        ),
                        statsRow(
                          textNormalAlignRight('Skill ratio', MyColors.lightGrey, 20),
                          textNormal(model.playerData.skillRatio.toString(), Colors.white, 20),
                        ),
                        statsRow(
                          textNormalAlignRight('Ult time', MyColors.lightGrey, 20),
                          textNormal(model.playerData.ultTime, Colors.white, 20),
                        ),
                        statsRow(
                          textNormalAlignRight('Global rank', MyColors.lightGrey, 20),
                          textNormal(model.playerData.globalRank, Colors.white, 20),
                        ),
                        statsRow(
                          textNormalAlignRight('Legend', MyColors.lightGrey, 20),
                          textNormal(model.playerData.legend, Colors.white, 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: textBold('CHARACTER STATS', MyColors.orange, 24),
                        ),
                        legendDataRow(
                          'https://arcane-fjord-65313.herokuapp.com/img/characters/Bangalore_Icon.png',
                          'Bangalore',
                          model.playerData.killsBangalore,
                          model.playerData.headshotsBangalore,
                          model.playerData.matchesBangalore,
                          MyColors.orange,
                        ),
                        legendDataRow(
                          'https://arcane-fjord-65313.herokuapp.com/img/characters/Bloodhound_Icon.png',
                          'Bloodhound',
                          model.playerData.killsBloodhound,
                          model.playerData.headshotsBloodhound,
                          model.playerData.matchesBloodhound,
                          MyColors.grey,
                        ),
                        legendDataRow(
                          'https://arcane-fjord-65313.herokuapp.com/img/characters/Caustic_Icon.png',
                          'Caustic',
                          model.playerData.killsCaustic,
                          model.playerData.headshotsCaustic,
                          model.playerData.matchesCaustic,
                          MyColors.orange,
                        ),
                        legendDataRow(
                          'https://arcane-fjord-65313.herokuapp.com/img/characters/Gibraltar_Icon.png',
                          'Gibraltar',
                          model.playerData.killsGibraltar,
                          model.playerData.headshotsGibraltar,
                          model.playerData.matchesGibraltar,
                          MyColors.grey,
                        ),
                        legendDataRow(
                          'https://arcane-fjord-65313.herokuapp.com/img/characters/Lifeline_Icon.png',
                          'Lifeline',
                          model.playerData.killsLifeline,
                          model.playerData.headshotsLifeline,
                          model.playerData.matchesLifeline,
                          MyColors.orange,
                        ),
                        legendDataRow(
                          'https://arcane-fjord-65313.herokuapp.com/img/characters/Mirage_Icon.png',
                          'Mirage',
                          model.playerData.killsMirage,
                          model.playerData.headshotsMirage,
                          model.playerData.matchesMirage,
                          MyColors.grey,
                        ),
                        legendDataRow(
                          'https://arcane-fjord-65313.herokuapp.com/img/characters/Pathfinder_Icon.png',
                          'Pathfinder',
                          model.playerData.killsPathfinder,
                          model.playerData.headshotsPathfinder,
                          model.playerData.matchesPathfinder,
                          MyColors.orange,
                        ),
                        legendDataRow(
                          'https://arcane-fjord-65313.herokuapp.com/img/characters/Wraith_Icon.png',
                          'Wraith',
                          model.playerData.killsWraith,
                          model.playerData.headshotsWraith,
                          model.playerData.matchesWraith,
                          MyColors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget statsRow(Widget label, value) {
    return Row(
      children: <Widget>[
        Expanded(
          child: label,
          flex: 1,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: value,
          ),
          flex: 2,
        ),
      ],
    );
  }

  Widget legendDataRow(String img, legend, kills, headshots, matches, color) {
    return Container(
      padding: EdgeInsets.all(8),
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(img)
                  ),
                ),
              ),
              textNormal(legend, Colors.white, 20),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  //shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('https://arcane-fjord-65313.herokuapp.com/img/icons8-accuracy-30.png')
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: textNormal(kills, Colors.white, 20),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              textNormal('Headshots', Colors.white, 20),
              Padding(
                padding: EdgeInsets.only(top: 14),
                child: textNormal(headshots, Colors.white, 20),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              textNormal('Matches', Colors.white, 20),
              Padding(
                padding: EdgeInsets.only(top: 14),
                child: textNormal(matches, Colors.white, 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
