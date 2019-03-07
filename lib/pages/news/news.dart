import 'package:flutter/material.dart';
import 'package:apex_stats_hub/custom_widgets.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/my_drawer.dart';

class News extends StatefulWidget {
  @override
  NewsState createState() {
    return new NewsState();
  }
}

class NewsState extends State<News> with AutomaticKeepAliveClientMixin<News>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onExitDialog(context);
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: MyColors.lightGrey),
          backgroundColor: MyColors.grey,
          title: textNormal('News', MyColors.lightGrey, 20),
        ),
        body: Container(
          color: MyColors.darkGrey,
          child: Center(
            child: textBold('COMING SOON!', MyColors.lightGrey, 30),
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
