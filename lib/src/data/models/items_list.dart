import 'item_model.dart';

class ItemsList {
  ItemsList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });
  late final int available;
  late final int returned;
  late final String collectionURI;
  late final List<ItemModel> items;

  ItemsList.fromJson(Map<String, dynamic> json){
    available = json['available'];
    returned = json['returned'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e)=>ItemModel.fromJson(e)).toList();
  }
}