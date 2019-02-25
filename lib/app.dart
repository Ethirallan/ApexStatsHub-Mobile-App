import 'package:flutter/material.dart';
import 'package:apex_stats_hub/pages/leaderboards/leaderboards.dart';
import 'package:apex_stats_hub/pages/guides/guides.dart';
import 'package:apex_stats_hub/pages/streams/streams.dart';
import 'package:apex_stats_hub/pages/news/news.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => LeaderBoards(),
        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/news': (context) => News(),
        '/guides': (context) => Guides(),
        '/streams': (context) => Streams(),
      },
    );
  }
}
