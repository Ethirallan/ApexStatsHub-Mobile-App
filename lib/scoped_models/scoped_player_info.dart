import 'package:scoped_model/scoped_model.dart';
import 'package:apex_stats_hub/models/player_data.dart';

class ScopedPlayerInfo extends Model {
  PlayerData playerData = new PlayerData();

  void setData(PlayerData data) {
    playerData = data;
    notifyListeners();
  }
}
