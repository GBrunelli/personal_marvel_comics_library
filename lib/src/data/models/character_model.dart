import 'result_model.dart';
import 'items_list.dart';
import 'image_model.dart';
import 'url_model.dart';

class CharacterModel extends Result{
  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.urls,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });
  late final int id;
  late final String name;
  late final String description;
  late final String modified;
  late final String resourceURI;
  late final List<UrlModel> urls;
  late final ImageModel thumbnail;
  late final ItemsList comics, stories, events, series;

  CharacterModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    resourceURI = json['resourceURI'];
    urls = List.from(json['urls']).map((e) => UrlModel.fromJson(e)).toList();
    thumbnail = ImageModel.fromJson(json['thumbnail']);
    comics = ItemsList.fromJson(json['comics']);
    stories = ItemsList.fromJson(json['stories']);
    events = ItemsList.fromJson(json['events']);
    series = ItemsList.fromJson(json['series']);
  }
}