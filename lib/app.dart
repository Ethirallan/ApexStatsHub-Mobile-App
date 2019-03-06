import 'package:flutter/material.dart';
import 'package:apex_stats_hub/pages/leaderboards/leaderboards.dart';
import 'package:apex_stats_hub/pages/news/news.dart';
import 'package:apex_stats_hub/pages/wiki/wiki.dart';
import 'package:apex_stats_hub/custom_widgets.dart';

class App extends StatelessWidget {

  static final PageController pageController = new PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () {
          onExitDialog(context);
        },
        child: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            News(),
            LeaderBoards(),
            Wiki(),
          ],
        ),
      ),
    );
  }
}

