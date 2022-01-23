import 'result_model.dart';
import 'image_model.dart';
import 'items_list.dart';
import 'url_model.dart';

class CreatorModel extends Result{
  CreatorModel({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.suffix,
    required this.fullName,
    required this.modified,
    required this.resourceURI,
    required this.urls,
    required this.thumbnail,
    required this.series,
    required this.stories,
    required this.comics,
    required this.events,
  });
  late final int id;
  late final String firstName;
  late final String middleName;
  late final String lastName;
  late final String suffix;
  late final String fullName;
  late final String modified;
  late final String resourceURI;
  late final List<UrlModel> urls;
  late final ImageModel thumbnail;
  late final ItemsList series;
  late final ItemsList stories;
  late final ItemsList comics;
  late final ItemsList events;

  CreatorModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    suffix = json['suffix'];
    fullName = json['fullName'];
    modified = json['modified'];
    resourceURI = json['resourceURI'];
    urls = List.from(json['urls']).map((e)=>UrlModel.fromJson(e)).toList();
    thumbnail = ImageModel.fromJson(json['thumbnail']);
    series = ItemsList.fromJson(json['series']);
    stories = ItemsList.fromJson(json['stories']);
    comics = ItemsList.fromJson(json['comics']);
    events = ItemsList.fromJson(json['events']);
  }
}