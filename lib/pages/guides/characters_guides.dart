import 'package:flutter/material.dart';
import 'package:apex_stats_hub/models/guides_html.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:youtube_player/youtube_player.dart';

class CharactersGuides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: MyColors.darkGrey,
      child: FutureBuilder<List<YTVideo>>(
        future: getGuides('legend'),
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
                  VideoPlayerController videoCtrl = new VideoPlayerController.network(ytVideo.url);
                  return Card(
                    elevation: 4,
                    child: Container(
                      child: YoutubePlayer(
                        context: context,
                        source: ytVideo.url,
                        quality: YoutubeQuality.HD,
                        autoPlay: false,
                        showThumbnail: true,
                        callbackController: (controller) {
                          videoCtrl = controller;
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            color: MyColors.darkGrey,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
