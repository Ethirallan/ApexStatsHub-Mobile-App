import 'package:flutter/material.dart';
import 'package:apex_stats_hub/models/weapons_html.dart';
import 'package:apex_stats_hub/pages/wiki/weapon_details.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/custom_widgets.dart';


class WeaponsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.darkGrey,
      child: FutureBuilder<List<Weapon>>(
        future: getWeapons(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Weapon> data = snapshot.data;
            return Container(
              padding: EdgeInsets.all(10),
              color: MyColors.darkGrey,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  Weapon weapon = data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeaponDetails(weapon, data)));
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3),),
                          color: index % 2 == 0 ? MyColors.grey : MyColors.orange,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 6),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 4),
                                        child: textBold(weapon.name, Colors.white, 20),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 4),
                                        child: textNormal('Ammo: ' + weapon.ammo, Colors.white, 20),
                                      ),
                                      textNormal(weapon.description, Colors.white, 20),
                                    ],
                                  ),
                                )
                            ),
                            Expanded(
                              child: Hero(
                                child: FadeInImage.assetNetwork(image: weapon.image.url, placeholder: 'assets/icon.jpg',),
                                tag: 'weaponImg' + weapon.name,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
