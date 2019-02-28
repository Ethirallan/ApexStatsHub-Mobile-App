import 'package:scoped_model/scoped_model.dart';
import 'package:apex_stats_hub/models/player_data_http.dart';
import 'package:flutter/material.dart';

class ScopedPlayerInfo extends Model {

  final TextEditingController searchPlayerCtrl = new TextEditingController();

  PlayerData playerData = new PlayerData();

  void setData(PlayerData data) {
    playerData = data;
    notifyListeners();
  }
}


