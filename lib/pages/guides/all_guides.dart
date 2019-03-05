import 'package:flutter/material.dart';
import 'package:apex_stats_hub/models/guides_html.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/custom_widgets.dart';


class AllGuides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: MyColors.darkGrey,
      child: FutureBuilder<List<YTVideo>>(
        future: getGuides('all'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<YTVideo> data = snapshot.data;
            return Container(
              padding: EdgeInsets.all(10),
              color: MyColors.darkGrey,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  YTVideo ytVideo = data[index];
                  return Card(
                    elevation: 4,
                    child: Container(
                      child: textNormal(ytVideo.url, Colors.white, 20),
                    )
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
