import 'package:path_provider/path_provider.dart';
import 'package:async_resource/async_resource.dart';
import 'package:async_resource/file_resource.dart';
import 'dart:convert';
import 'package:apex_stats_hub/models/image_object.dart';

Future<List<Legend>> getLegends() async {
  final path = (await getApplicationDocumentsDirectory()).path;
  List<Legend> legends;

  final legendsResource = HttpNetworkResource<Future<Legend>>(
    url: 'http://vakedomen.ddns.net:4000/legends',
    parser: (contents) {
      Iterable list = json.decode(contents);
      legends = list.map((model) => Legend.fromJson(model)).toList();
    },
    cache: FileResource(File('$path/legends.json')),
    maxAge: Duration(days: 5),
    strategy: CacheStrategy.cacheFirst,
  );

  await legendsResource.get();
  return legends;
}

class Legend {

  var id;
  String name;
  String description;
  String motto;
  String type;
  String realName;
  String age;
  ImageObject image;
  List<Ability> abilities;

  Legend({
    this.id,
    this.name,
    this.description,
    this.motto,
    this.type,
    this.realName,
    this.age,
    this.image,
    this.abilities,
  });


  factory Legend.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['abilities'] as List;
    List<Ability> abilityList = list.map((i) => Ability.fromJson(i)).toList();

    return Legend(
      id: parsedJson['id'],
      name: parsedJson['name'],
      description: parsedJson['description'],
      motto: parsedJson['motto'],
      type: parsedJson['type'],
      realName: parsedJson['real_name'],
      age: parsedJson['age'],
      image: ImageObject.fromJson(parsedJson['images'][0]),
      abilities: abilityList,
    );
  }

}

class Ability {
  var legendId;
  String name;
  String effect;
  var cooldown;
  var radius;
  var damage;
  var healing;
  var shield;
  var duration;
  String imageUrl;

  Ability({
    this.legendId,
    this.name,
    this.effect,
    this.cooldown,
    this.radius,
    this.damage,
    this.healing,
    this.shield,
    this.duration,
    this.imageUrl,
  });

  factory Ability.fromJson(Map<String, dynamic> parsedJson){
    return Ability(
      legendId: parsedJson['legend_id'],
      name: parsedJson['name'],
      effect: parsedJson['effect'],
      cooldown: parsedJson['cooldown'],
      radius: parsedJson['radius'],
      damage: parsedJson['damage'],
      healing: parsedJson['healing'],
      shield: parsedJson['shield'],
      duration: parsedJson['duration'],
      imageUrl: parsedJson['image_url'],
    );
  }
}

