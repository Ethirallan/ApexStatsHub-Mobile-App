import 'package:path_provider/path_provider.dart';
import 'package:async_resource/async_resource.dart';
import 'package:async_resource/file_resource.dart';
import 'dart:convert';

class PlayerData {

  Future<PlayerData> getPlayerData(String name) async {
    final path = (await getApplicationDocumentsDirectory()).path;
    PlayerData playerData;

    final playerDataResource = HttpNetworkResource<Future<PlayerData>>(
      url: 'http://vakedomen.ddns.net:4000/player?platform=pc&player=$name',
      parser: (contents) {
        Map<String, dynamic> json = jsonDecode(contents);
        playerData = PlayerData.fromJson(json);
      },
      cache: FileResource(File('$path/player_data.json')),
      maxAge: Duration(days: 10),
      strategy: CacheStrategy.networkFirst,
    );

    await playerDataResource.get();
    return playerData;
  }


  bool playerfound;
  String aid;
  String name;
  String platform;
  int skillratio;
  String visits;
  String avatar;
  String legend;
  String level;
  String kills;
  String headshots;
  String matches;
  String damage;
  var lastdata;
  String kills_Bloodhound;
  String kills_Gibraltar;
  String kills_Lifeline;
  String kills_Pathfinder;
  String kills_Wraith;
  String kills_Bangalore;
  String kills_Caustic;
  String kills_Mirage;
  String headshots_Bloodhound;
  String headshots_Gibraltar;
  String headshots_Lifeline;
  String headshots_Pathfinder;
  String headshots_Wraith;
  String headshots_Bangalore;
  String headshots_Caustic;
  String headshots_Mirage;
  String matches_Bloodhound;
  String matches_Gibraltar;
  String matches_Lifeline;
  String matches_Pathfinder;
  String matches_Wraith;
  String matches_Bangalore;
  String matches_Caustic;
  String matches_Mirage;
  String damage_Bloodhound;
  String damage_Gibraltar;
  String damage_Lifeline;
  String damage_Pathfinder;
  String damage_Wraith;
  String damage_Bangalore;
  String damage_Caustic;
  String damage_Mirage;
  String globalrank;
  String utime;
  var daily_stats;

  PlayerData({
    this.playerfound,
    this.aid,
    this.name,
    this.platform,
    this.skillratio,
    this.visits,
    this.avatar,
    this.legend,
    this.level,
    this.kills,
    this.headshots,
    this.matches,
    this.damage,
    this.lastdata,
    this.kills_Bloodhound,
    this.kills_Gibraltar,
    this.kills_Lifeline,
    this.kills_Pathfinder,
    this.kills_Wraith,
    this.kills_Bangalore,
    this.kills_Caustic,
    this.kills_Mirage,
    this.headshots_Bloodhound,
    this.headshots_Gibraltar,
    this.headshots_Lifeline,
    this.headshots_Pathfinder,
    this.headshots_Wraith,
    this.headshots_Bangalore,
    this.headshots_Caustic,
    this.headshots_Mirage,
    this.matches_Bloodhound,
    this.matches_Gibraltar,
    this.matches_Lifeline,
    this.matches_Pathfinder,
    this.matches_Wraith,
    this.matches_Bangalore,
    this.matches_Caustic,
    this.matches_Mirage,
    this.damage_Bloodhound,
    this.damage_Gibraltar,
    this.damage_Lifeline,
    this.damage_Pathfinder,
    this.damage_Wraith,
    this.damage_Bangalore,
    this.damage_Caustic,
    this.damage_Mirage,
    this.globalrank,
    this.utime,
    this.daily_stats
  });


  factory PlayerData.fromJson(Map<String, dynamic> parsedJson){
    return PlayerData(
      playerfound: parsedJson['playerfound'],
      aid : parsedJson['aid'],
      platform : parsedJson ['platform'],
      name : parsedJson ['name'],
      skillratio : parsedJson ['skillratio'],
      visits : parsedJson ['visits'],
      avatar : parsedJson ['avatar'],
      legend : parsedJson ['legend'],
      level : parsedJson ['level'],
      kills : parsedJson ['kills'],
      headshots : parsedJson ['headshots'],
      matches : parsedJson ['matches'],
      damage : parsedJson ['damage'],
      lastdata : parsedJson ['lastdata'],
      kills_Bloodhound : parsedJson ['kills_Bloodhound'],
      kills_Gibraltar : parsedJson ['kills_Gibraltar'],
      kills_Lifeline : parsedJson ['kills_Lifeline'],
      kills_Pathfinder : parsedJson ['kills_Pathfinder'],
      kills_Wraith : parsedJson ['kills_Wraith'],
      kills_Bangalore : parsedJson ['kills_Bangalore'],
      kills_Caustic : parsedJson ['kills_Caustic'],
      kills_Mirage : parsedJson ['kills_Mirage'],
      headshots_Bloodhound : parsedJson ['headshots_Bloodhound'],
      headshots_Gibraltar : parsedJson ['headshots_Gibraltar'],
      headshots_Lifeline : parsedJson ['headshots_Lifeline'],
      headshots_Pathfinder : parsedJson ['headshots_Pathfinder'],
      headshots_Wraith : parsedJson ['headshots_Wraith'],
      headshots_Bangalore : parsedJson ['headshots_Bangalore'],
      headshots_Caustic : parsedJson ['headshots_Caustic'],
      headshots_Mirage : parsedJson ['headshots_Mirage'],
      matches_Bloodhound : parsedJson ['matches_Bloodhound'],
      matches_Gibraltar : parsedJson ['matches_Gibraltar'],
      matches_Lifeline : parsedJson ['matches_Lifeline'],
      matches_Pathfinder : parsedJson ['matches_Pathfinder'],
      matches_Wraith : parsedJson ['matches_Wraith'],
      matches_Bangalore : parsedJson ['matches_Bangalore'],
      matches_Caustic : parsedJson ['matches_Caustic'],
      matches_Mirage : parsedJson ['matches_Mirage'],
      damage_Bloodhound : parsedJson ['damage_Bloodhound'],
      damage_Gibraltar : parsedJson ['damage_Gibraltar'],
      damage_Lifeline : parsedJson ['damage_Lifeline'],
      damage_Pathfinder : parsedJson ['damage_Pathfinder'],
      damage_Wraith : parsedJson ['damage_Wraith'],
      damage_Bangalore : parsedJson ['damage_Bangalore'],
      damage_Caustic : parsedJson ['damage_Caustic'],
      damage_Mirage : parsedJson ['damage_Mirage'],
      globalrank : parsedJson ['globalrank'],
      utime : parsedJson ['utime'],
      daily_stats : parsedJson ['daily_stats'],
    );
  }

}

