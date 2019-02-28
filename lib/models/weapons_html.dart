import 'package:path_provider/path_provider.dart';
import 'package:async_resource/async_resource.dart';
import 'package:async_resource/file_resource.dart';
import 'dart:convert';

Future<List<Weapon>> getWeapons() async {
  final path = (await getApplicationDocumentsDirectory()).path;
  List<Weapon> weapons;

  final weaponsResource = HttpNetworkResource<Future<Weapon>>(
    url: 'http://vakedomen.ddns.net:4000/weapons',
    parser: (contents) {
      Iterable list = json.decode(contents);
      weapons = list.map((model) => Weapon.fromJson(model)).toList();
    },
    cache: FileResource(File('$path/weapons.json')),
    maxAge: Duration(days: 5),
    strategy: CacheStrategy.cacheFirst,
  );

  await weaponsResource.get();
  return weapons;
}

class WeaponCalculations {
  double maxLoadingTime = 0.0;
  double maxEmptyTime = 0.0;
  double maxMagSize = 0.0;
  double maxBodyDMG = 0.0;
  double maxHeadDMG = 0.0;
  double maxRPM = 0.0;
  double maxBodyDPS = 0.0;
  double maxHeadDPS = 0.0;
  double maxMaxHeadshotRange = 0.0;

  void getMaxValues(List<Weapon> weapons) {
    for (int i = 0; i < weapons.length; i++) {
      if (weapons[i].loadingTime > maxLoadingTime.toDouble()) maxLoadingTime = weapons[i].loadingTime.toDouble();
      if (weapons[i].emptyTime > maxEmptyTime.toDouble()) maxEmptyTime = weapons[i].emptyTime.toDouble();
      if (weapons[i].magSize.toDouble() > maxMagSize) maxMagSize = weapons[i].magSize.toDouble();
      if (weapons[i].dmgBody.toDouble() > maxBodyDMG) maxBodyDMG = weapons[i].dmgBody.toDouble();
      if (weapons[i].dmgHead.toDouble() > maxHeadDMG) maxHeadDMG = weapons[i].dmgHead.toDouble();
      if (weapons[i].rpm.toDouble() > maxRPM) maxRPM = weapons[i].rpm.toDouble();
      if (weapons[i].dpsBody.toDouble() > maxBodyDPS) maxBodyDPS = weapons[i].dpsBody.toDouble();
      if (weapons[i].dpsHead.toDouble() > maxHeadDPS) maxHeadDPS = weapons[i].dpsHead.toDouble();
      if (weapons[i].maxHeadshotRange.toDouble() > maxMaxHeadshotRange) maxMaxHeadshotRange = weapons[i].maxHeadshotRange.toDouble();
    }
  }

}

class Weapon {

  var id;
  var name;
  var description;
  var weaponsClass;
  var ammo;
  var loadingTime;
  var emptyTime;
  var magSize;
  var dmgBody;
  var dmgHead;
  var dmgMultiplier;
  var maxHeadshotRange;
  var dpsBody;
  var dpsHead;
  var rpm;
  List<String> fireMode;
  List<String> attachments;
  var recoil;
  WeaponImage image;


  Weapon({
    this.id,
    this.name,
    this.description,
    this.weaponsClass,
    this.ammo,
    this.loadingTime,
    this.emptyTime,
    this.magSize,
    this.dmgBody,
    this.dmgHead,
    this.dmgMultiplier,
    this.maxHeadshotRange,
    this.dpsBody,
    this.dpsHead,
    this.rpm,
    this.fireMode,
    this.attachments,
    this.recoil,
    this.image,
  });


  factory Weapon.fromJson(Map<String, dynamic> parsedJson){

    var fireModeFromJson = parsedJson['fire_mode'];
    List<String> fireModeJson = new List<String>.from(fireModeFromJson);

    var attachmentsFromJson = parsedJson['attachments'];
    List<String> attachmentsJson = new List<String>.from(attachmentsFromJson);

    return Weapon(
      id: parsedJson['id'],
      name: parsedJson['name'],
      description: parsedJson['description'],
      weaponsClass: parsedJson['class'],
      ammo: parsedJson['ammo'],
      loadingTime: parsedJson['loading_time'],
      emptyTime: parsedJson['empty_time'],
      magSize: parsedJson['mag_size'],
      dmgBody: parsedJson['dmg_body'],
      dmgHead: parsedJson['dmg_head'],
      dmgMultiplier: parsedJson['dmg_multiplier'],
      maxHeadshotRange: parsedJson['max_headshot_range'],
      dpsBody: parsedJson['dps_body'],
      dpsHead: parsedJson['dps_head'],
      rpm: parsedJson['rpm'],
      fireMode: fireModeJson,
      attachments: attachmentsJson,
      recoil: parsedJson['recoil'],
      image: WeaponImage.fromJson(parsedJson['image'][0]),
    );
  }

}

class WeaponImage {
  String alias;
  String url;

  WeaponImage({this.alias, this.url});

  factory WeaponImage.fromJson(Map<String, dynamic> parsedJson){
    return WeaponImage(
      alias: parsedJson['alias'],
      url: parsedJson['url'],
    );
  }
}

