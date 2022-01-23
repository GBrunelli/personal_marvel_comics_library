class ImageModel {
  ImageModel({
    required this.path,
    required this.extension,
  });
  late final String path;
  late final String extension;

  ImageModel.fromJson(Map<String, dynamic> json){
    path = json['path'];
    extension = json['extension'];
  }
}