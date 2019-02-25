import 'package:flutter/material.dart';
import 'package:apex_stats_hub/my_colors.dart';

class ApexPlayerSearchBar extends StatelessWidget {
  final Function arrowFunction;
  final TextEditingController searchBarCtrl;
  ApexPlayerSearchBar({this.searchBarCtrl, this.arrowFunction});

  Widget orangeBoxWithIconGaming() {
    return SizedBox(
      height: 50,
      width: 50,
      child: RaisedButton(
        onPressed: () {},
        color: MyColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3),
            bottomLeft: Radius.circular(3),
          ),
        ),
        child: Icon(Icons.videogame_asset, color: Colors.white, size: 30,),
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
                child: orangeBoxWithIconGaming(),
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

Widget textNormal(String text, Color color, double size) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget textBold(String text, Color color, double size) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
  );
}


