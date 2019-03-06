import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:apex_stats_hub/pages/leaderboards/leaderboards.dart';


Future<PlayerData> getPlayerData(String name) async {
  PlayerData playerData;
  String url = 'http://vakedomen.ddns.net:4000/player?platform=${LeaderBoardsState.scopedPlayerInfo.selectedPlatform}&player=$name';
  var response = await http.get(url);
  if (response.statusCode == 200) {
    Map<String, dynamic> json = convert.jsonDecode(response.body);
    playerData = PlayerData.fromJson(json);
  } else {
    print("Request failed with status: ${response.statusCode}.");
  }

  return playerData;
}

class PlayerData {

  bool playerFound;
  String aid;
  String name;
  String platform;
  int skillRatio;
  String visits;
  String avatar;
  String legend;
  String level;
  String kills;
  String headshots;
  String matches;
  String damage;
  var lastData;
  String killsBloodhound;
  String killsGibraltar;
  String killsLifeline;
  String killsPathfinder;
  String killsWraith;
  String killsBangalore;
  String killsCaustic;
  String killsMirage;
  String headshotsBloodhound;
  String headshotsGibraltar;
  String headshotsLifeline;
  String headshotsPathfinder;
  String headshotsWraith;
  String headshotsBangalore;
  String headshotsCaustic;
  String headshotsMirage;
  String matchesBloodhound;
  String matchesGibraltar;
  String matchesLifeline;
  String matchesPathfinder;
  String matchesWraith;
  String matchesBangalore;
  String matchesCaustic;
  String matchesMirage;
  String damageBloodhound;
  String damageGibraltar;
  String damageLifeline;
  String damagePathfinder;
  String damageWraith;
  String damageBangalore;
  String damageCaustic;
  String damageMirage;
  String globalRank;
  String ultTime;
  var dailyStats;

  PlayerData({
    this.playerFound,
    this.aid,
    this.name,
    this.platform,
    this.skillRatio,
    this.visits,
    this.avatar,
    this.legend,
    this.level,
    this.kills,
    this.headshots,
    this.matches,
    this.damage,
    this.lastData,
    this.killsBloodhound,
    this.killsGibraltar,
    this.killsLifeline,
    this.killsPathfinder,
    this.killsWraith,
    this.killsBangalore,
    this.killsCaustic,
    this.killsMirage,
    this.headshotsBloodhound,
    this.headshotsGibraltar,
    this.headshotsLifeline,
    this.headshotsPathfinder,
    this.headshotsWraith,
    this.headshotsBangalore,
    this.headshotsCaustic,
    this.headshotsMirage,
    this.matchesBloodhound,
    this.matchesGibraltar,
    this.matchesLifeline,
    this.matchesPathfinder,
    this.matchesWraith,
    this.matchesBangalore,
    this.matchesCaustic,
    this.matchesMirage,
    this.damageBloodhound,
    this.damageGibraltar,
    this.damageLifeline,
    this.damagePathfinder,
    this.damageWraith,
    this.damageBangalore,
    this.damageCaustic,
    this.damageMirage,
    this.globalRank,
    this.ultTime,
    this.dailyStats
  });


  factory PlayerData.fromJson(Map<String, dynamic> parsedJson){
    return PlayerData(
      playerFound: parsedJson['playerfound'],
      aid : parsedJson['aid'],
      platform : parsedJson ['platform'],
      name : parsedJson ['name'],
      skillRatio : parsedJson ['skillratio'],
      visits : parsedJson ['visits'],
      avatar : parsedJson ['avatar'],
      legend : parsedJson ['legend'],
      level : parsedJson ['level'],
      kills : parsedJson ['kills'],
      headshots : parsedJson ['headshots'],
      matches : parsedJson ['matches'],
      damage : parsedJson ['damage'],
      lastData : parsedJson ['lastdata'],
      killsBloodhound : parsedJson ['kills_Bloodhound'],
      killsGibraltar : parsedJson ['kills_Gibraltar'],
      killsLifeline : parsedJson ['kills_Lifeline'],
      killsPathfinder : parsedJson ['kills_Pathfinder'],
      killsWraith : parsedJson ['kills_Wraith'],
      killsBangalore : parsedJson ['kills_Bangalore'],
      killsCaustic : parsedJson ['kills_Caustic'],
      killsMirage : parsedJson ['kills_Mirage'],
      headshotsBloodhound : parsedJson ['headshots_Bloodhound'],
      headshotsGibraltar : parsedJson ['headshots_Gibraltar'],
      headshotsLifeline : parsedJson ['headshots_Lifeline'],
      headshotsPathfinder : parsedJson ['headshots_Pathfinder'],
      headshotsWraith : parsedJson ['headshots_Wraith'],
      headshotsBangalore : parsedJson ['headshots_Bangalore'],
      headshotsCaustic : parsedJson ['headshots_Caustic'],
      headshotsMirage : parsedJson ['headshots_Mirage'],
      matchesBloodhound : parsedJson ['matches_Bloodhound'],
      matchesGibraltar : parsedJson ['matches_Gibraltar'],
      matchesLifeline : parsedJson ['matches_Lifeline'],
      matchesPathfinder : parsedJson ['matches_Pathfinder'],
      matchesWraith : parsedJson ['matches_Wraith'],
      matchesBangalore : parsedJson ['matches_Bangalore'],
      matchesCaustic : parsedJson ['matches_Caustic'],
      matchesMirage : parsedJson ['matches_Mirage'],
      damageBloodhound : parsedJson ['damage_Bloodhound'],
      damageGibraltar : parsedJson ['damage_Gibraltar'],
      damageLifeline : parsedJson ['damage_Lifeline'],
      damagePathfinder : parsedJson ['damage_Pathfinder'],
      damageWraith : parsedJson ['damage_Wraith'],
      damageBangalore : parsedJson ['damage_Bangalore'],
      damageCaustic : parsedJson ['damage_Caustic'],
      damageMirage : parsedJson ['damage_Mirage'],
      globalRank : parsedJson ['globalrank'],
      ultTime : parsedJson ['utime'],
      dailyStats : parsedJson ['daily_stats'],
    );
  }

}

