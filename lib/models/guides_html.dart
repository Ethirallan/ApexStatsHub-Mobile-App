import 'package:path_provider/path_provider.dart';
import 'package:async_resource/async_resource.dart';
import 'package:async_resource/file_resource.dart';
import 'dart:convert';
import 'package:apex_stats_hub/models/image_object.dart';

Future<List<YTVideo>> getGuides(String category) async {
  final path = (await getApplicationDocumentsDirectory()).path;
  List<YTVideo> ytVideos;

  final guideResource = HttpNetworkResource<Future<YTVideo>>(
    url: 'http://vakedomen.ddns.net:4000/loader/video/category/$category',
    parser: (contents) {
      Iterable list = json.decode(contents);
      ytVideos = list.map((model) => YTVideo.fromJson(model)).toList();
    },
    cache: FileResource(File('$path/guides$category.json')),
    maxAge: Duration(days: 5),
    strategy: CacheStrategy.cacheFirst,
  );

  await guideResource.get();
  return ytVideos;
}

class YTVideo {

  var id;
  String alias;
  String url;
  List<String> categories;

  YTVideo({
    this.id,
    this.alias,
    this.url,
    this.categories,
  });


  factory YTVideo.fromJson(Map<String, dynamic> parsedJson){

    var categoryFromJson = parsedJson['categories'];
    List<String> categoriesJson = new List<String>.from(categoryFromJson);

    return YTVideo(
      id: parsedJson['id'],
      alias: parsedJson['alias'],
      url: parsedJson['url'],
      categories: categoriesJson,
    );
  }
}

