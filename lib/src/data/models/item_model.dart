class ItemModel {
  ItemModel({
    required this.resourceURI,
    required this.name,
  });
  late final String resourceURI;
  late final String name;

  ItemModel.fromJson(Map<String, dynamic> json){
    resourceURI = json['resourceURI'];
    name = json['name'];
  }
}