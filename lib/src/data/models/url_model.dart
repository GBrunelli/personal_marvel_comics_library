class UrlModel {
  UrlModel({
    required this.type,
    required this.url,
  });
  late final String type;
  late final String url;

  UrlModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    url = json['url'];
  }
}