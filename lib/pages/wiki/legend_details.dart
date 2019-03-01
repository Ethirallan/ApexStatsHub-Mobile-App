import 'package:flutter/material.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/models/legends_html.dart';
import 'package:groovin_widgets/groovin_expansion_tile.dart';

class LegendDetails extends StatelessWidget {

  final Legend legend;
  LegendDetails(this.legend);

  @override
  Widget build(BuildContext context) {
    var abilityList = List<Widget>();
    for (int i = 0; i < legend.abilities.length; i++) {
      Ability ability = legend.abilities[i];
      abilityList.add(GroovinExpansionTile(
        title: textNormal(ability.name, MyColors.lightGrey, 20),
        leading: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(ability.imageUrl),
            ),
          ),
        ),
        children: <Widget>[
          Card(
            color: MyColors.orange,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  legendInfoRow(
                    textNormalAlignRight('Effect', MyColors.darkGrey, 20),
                    textNormal(ability.effect, Colors.white, 20),
                  ),
                  legendInfoRow(
                    textNormalAlignRight('Cooldown', MyColors.darkGrey, 20),
                    textNormal(ability.cooldown.toString(), Colors.white, 20),
                  ),
                  legendInfoRow(
                    textNormalAlignRight('Radius', MyColors.darkGrey, 20),
                    textNormal(ability.radius.toString(), Colors.white, 20),
                  ),
                  legendInfoRow(
                    textNormalAlignRight('Damage', MyColors.darkGrey, 20),
                    textNormal(ability.damage.toString(), Colors.white, 20),
                  ),
                  legendInfoRow(
                    textNormalAlignRight('Healing', MyColors.darkGrey, 20),
                    textNormal(ability.healing.toString(), Colors.white, 20),
                  ),
                  legendInfoRow(
                    textNormalAlignRight('Shield', MyColors.darkGrey, 20),
                    textNormal(ability.shield.toString(), Colors.white, 20),
                  ),
                  legendInfoRow(
                    textNormalAlignRight('Duration', MyColors.darkGrey, 20),
                    textNormal(ability.duration.toString(), Colors.white, 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: textNormal(legend.name, MyColors.lightGrey, 20),
        backgroundColor: MyColors.grey,
        iconTheme: new IconThemeData(color: MyColors.lightGrey),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: MyColors.darkGrey,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                child: Image.network(legend.image.url),
                tag: 'legendImg' + legend.name,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    legendInfoRow(
                      textNormalAlignRight('Type', MyColors.lightGrey, 20),
                      textNormal(legend.type, Colors.white, 20),
                    ),
                    legendInfoRow(
                      textNormalAlignRight('Real name', MyColors.lightGrey, 20),
                      textNormal(legend.realName, Colors.white, 20),
                    ),
                    legendInfoRow(
                      textNormalAlignRight('Age', MyColors.lightGrey, 20),
                      textNormal(legend.age, Colors.white, 20),
                    ),
                    GroovinExpansionTile(
                      title: textNormal('Description', MyColors.lightGrey, 20),
                      children: <Widget>[
                        Card(
                          color: MyColors.orange,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: textNormal(legend.description, Colors.white, 20),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: abilityList,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget legendInfoRow(Widget label, value) {
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
}
