class ImageObject {
  String alias;
  String url;

  ImageObject({this.alias, this.url});

  factory ImageObject.fromJson(Map<String, dynamic> parsedJson){
    return ImageObject(
      alias: parsedJson['alias'],
      url: parsedJson['url'],
    );
  }
}