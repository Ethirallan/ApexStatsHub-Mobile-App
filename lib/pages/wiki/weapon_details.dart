import 'package:flutter/material.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/models/weapons_html.dart';
import 'package:apex_stats_hub/pages/wiki/color_bar_for_stats.dart';

class WeaponDetails extends StatelessWidget {

  final Weapon weapon;
  final List<Weapon> weaponList;

  WeaponDetails(this.weapon, this.weaponList);

  @override
  Widget build(BuildContext context) {

    WeaponCalculations wCalc = new WeaponCalculations();
    wCalc.getMaxValues(weaponList);

    return Scaffold(
      appBar: AppBar(
        title: textNormal(weapon.name, MyColors.lightGrey, 20),
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
                child: Image.network(weapon.image.url),
                tag: 'weaponImg' + weapon.name,
              ),
              Padding(
                padding: EdgeInsets.only(top: 4, bottom: 4),
                child: textNormal('Description: ' + weapon.description, MyColors.lightGrey, 20),
              ),
              textNormal('Ammo: ' + weapon.ammo, MyColors.lightGrey, 20),
              Padding(
                padding: EdgeInsets.only(top: 4, bottom: 4),
                child: textNormal('Recoil: ' + weapon.recoil, Colors.white, 20),
              ),
              ColorBarForStats(textNormal('Loading time: ' + weapon.loadingTime.toString(), Colors.white, 20), getPercent(wCalc.maxLoadingTime, weapon.loadingTime)),
              ColorBarForStats(textNormal('Empty time: ' + weapon.emptyTime.toString(), Colors.white, 20), getPercent(wCalc.maxEmptyTime, weapon.emptyTime)),
              ColorBarForStats(textNormal('Mag size: ' + weapon.magSize.toString(), Colors.white, 20), getPercent(wCalc.maxMagSize, weapon.magSize)),
              ColorBarForStats(textNormal('Body DMG: ' + weapon.dmgBody.toString(), Colors.white, 20), getPercent(wCalc.maxBodyDMG, weapon.dmgBody)),
              ColorBarForStats(textNormal('Head DMG: ' + weapon.dmgHead.toString(), Colors.white, 20), getPercent(wCalc.maxHeadDMG, weapon.dmgHead)),
              ColorBarForStats(textNormal('RPM: ' + weapon.rpm.toString(), Colors.white, 20), getPercent(wCalc.maxRPM, weapon.rpm)),
              ColorBarForStats(textNormal('Body DPS: ' + weapon.dpsBody.toString(), Colors.white, 20), getPercent(wCalc.maxBodyDPS, weapon.dpsBody)),
              ColorBarForStats(textNormal('HeadDPS: ' + weapon.dpsHead.toString(), Colors.white, 20), getPercent(wCalc.maxHeadDPS, weapon.dpsHead)),
              ColorBarForStats(textNormal('Max headshot range: ' + weapon.maxHeadshotRange.toString(), Colors.white, 20), getPercent(wCalc.maxMaxHeadshotRange, weapon.maxHeadshotRange)),
            ],
          ),
        ),
      ),
    );
  }

  double getPercent(double max, x) {
    return x / max;
  }
}
