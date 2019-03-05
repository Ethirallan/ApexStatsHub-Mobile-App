import 'package:flutter/material.dart';
import 'package:apex_stats_hub/models/legends_html.dart';
import 'package:apex_stats_hub/pages/wiki/legend_details.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/custom_widgets.dart';


class LegendsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.darkGrey,
      child: FutureBuilder<List<Legend>>(
        future: getLegends(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Legend> data = snapshot.data;
            return Container(
              padding: EdgeInsets.all(10),
              color: MyColors.darkGrey,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  Legend legend = data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LegendDetails(legend)));
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3),),
                          color: index % 2 == 0 ? MyColors.grey : MyColors.orange,
                        ),
                        padding: EdgeInsets.all(4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Hero(
                                child: Image.network(legend.image.url),
                                tag: 'legendImg' + legend.name,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 4),
                                      child: textBold(legend.name, Colors.white, 20),
                                    ),
                                    textNormal('\"' + legend.motto + '\"', Colors.white, 20)
                                  ],
                                )
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
