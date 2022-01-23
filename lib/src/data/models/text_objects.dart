class TextObject {
  TextObject({
    required this.type,
    required this.language,
    required this.text,
  });
  late final String type;
  late final String language;
  late final String text;

  TextObject.fromJson(Map<String, dynamic> json){
    type = json['type'];
    language = json['language'];
    text = json['text'];
  }
}