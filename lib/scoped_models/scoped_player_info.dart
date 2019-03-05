import 'package:scoped_model/scoped_model.dart';
import 'package:apex_stats_hub/models/player_data_http.dart';
import 'package:flutter/material.dart';

class ScopedPlayerInfo extends Model {

  final TextEditingController searchPlayerCtrl = new TextEditingController();
  IconData platformIcon = Icons.laptop_windows;
  String selectedPlatform = 'pc';

  PlayerData playerData = new PlayerData();

  void setData(PlayerData data) {
    playerData = data;
    notifyListeners();
  }

  void setPlatformInfo(String val) {
    selectedPlatform = val;
    if (val == 'pc') {
      platformIcon = Icons.laptop_windows;
    } else if (val == 'ps') {
      platformIcon = Icons.gamepad;
    } else {
      platformIcon = Icons.videogame_asset;
    }
    notifyListeners();
  }
}


