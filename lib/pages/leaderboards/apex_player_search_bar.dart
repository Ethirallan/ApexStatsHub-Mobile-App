import 'package:flutter/material.dart';
import 'package:apex_stats_hub/my_colors.dart';
import 'package:apex_stats_hub/pages/leaderboards/leaderboards.dart';
import 'package:apex_stats_hub/custom_widgets.dart';

class ApexPlayerSearchBar extends StatelessWidget {
  final BuildContext context;
  final Function arrowFunction;
  final TextEditingController searchBarCtrl;
  ApexPlayerSearchBar({this.searchBarCtrl, this.arrowFunction, this.context});

  Widget orangeBoxWithPlatformIcon() {
    return SizedBox(
      height: 50,
      width: 50,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3),
            bottomLeft: Radius.circular(3),
          )
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            cardColor: MyColors.grey,
          ),
          child: PopupMenuButton(
            icon: Icon(LeaderBoardsState.scopedPlayerInfo.platformIcon, color: Colors.white, size: 30,),
            onSelected: (val)  {
              LeaderBoardsState.scopedPlayerInfo.setPlatformInfo(val);
            },
            itemBuilder: (_) => <PopupMenuItem<String>>[
              PopupMenuItem<String>(child: textNormal('Windows', MyColors.orange, 20), value: 'pc'),
              PopupMenuItem<String>(child: textNormal('PlayStation', MyColors.orange, 20), value: 'psn'),
              PopupMenuItem<String>(child: textNormal('Xbox', MyColors.orange, 20), value: 'xbl'),
            ],
          ),
        ),
      ),
    );
  }

  Widget orangeBoxWithIconArrow() {
    return SizedBox(
      height: 50,
      width: 50,
      child: RaisedButton(
        onPressed: arrowFunction,
        color: MyColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(3),
            bottomRight: Radius.circular(3),
          ),
        ),
        child: Icon(Icons.arrow_forward, color: Colors.white, size: 30,),
      ),
    );
  }

  Widget playerSearchBarField(TextEditingController ctrl) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20),
      child: TextFormField(
        style: TextStyle(
          color: MyColors.darkGrey,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        controller: ctrl,
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (term) async {
          await LeaderBoardsState().searchForPlayer();
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search profile',
          hintStyle: TextStyle(
            color: MyColors.grey,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: 50,
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: orangeBoxWithPlatformIcon(),
                flex: 1,
              ),
              Expanded(
                child: playerSearchBarField(searchBarCtrl),
                flex: 4,
              ),
              Expanded(
                child: orangeBoxWithIconArrow(),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}