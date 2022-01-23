import 'price_model.dart';
import 'text_objects.dart';
import 'date_model.dart';
import 'item_model.dart';
import 'result_model.dart';
import 'items_list.dart';
import 'image_model.dart';
import 'url_model.dart';

class ComicModel extends Result{
  ComicModel({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceURI,
    required this.urls,
    required this.series,
    required this.variants,
    required this.collections,
    required this.collectedIssues,
    required this.dates,
    required this.prices,
    required this.thumbnail,
    required this.images,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.events,
  });
  late final int id;
  late final int digitalId;
  late final String title;
  late final double issueNumber;
  late final String variantDescription;
  late final String description;
  late final String modified;
  late final String isbn;
  late final String upc;
  late final String diamondCode;
  late final String ean;
  late final String issn;
  late final String format;
  late final int pageCount;
  late final List<TextObject> textObjects;
  late final String resourceURI;
  late final List<UrlModel> urls;
  late final ItemModel series;
  late final List<ItemModel> variants;
  late final List<ItemModel> collections;
  late final List<ItemModel> collectedIssues;
  late final List<DateModel> dates;
  late final List<PriceModel> prices;
  late final ImageModel thumbnail;
  late final List<ImageModel> images;
  late final ItemsList creators;
  late final ItemsList characters;
  late final ItemsList stories;
  late final ItemsList events;

  ComicModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    issueNumber = json['issueNumber'].toDouble();
    variantDescription = json['variantDescription'];
    description = json['description'] ?? '';
    modified = json['modified'];
    isbn = json['isbn'];
    upc = json['upc'];
    diamondCode = json['diamondCode'];
    ean = json['ean'];
    issn = json['issn'];
    format = json['format'];
    pageCount = json['pageCount'];
    textObjects = List.from(json['textObjects']).map((e)=>TextObject.fromJson(e)).toList();
    resourceURI = json['resourceURI'];
    urls = List.from(json['urls']).map((e)=>UrlModel.fromJson(e)).toList();
    series = ItemModel.fromJson(json['series']);
    variants = List.from(json['variants']).map((e)=>ItemModel.fromJson(e)).toList();
    collections = List.from(json['collections']).map((e)=>ItemModel.fromJson(e)).toList();
    collectedIssues = List.from(json['collectedIssues']).map((e)=>ItemModel.fromJson(e)).toList();
    dates = List.from(json['dates']).map((e)=>DateModel.fromJson(e)).toList();
    prices = List.from(json['prices']).map((e)=>PriceModel.fromJson(e)).toList();
    thumbnail = ImageModel.fromJson(json['thumbnail']);
    images = List.from(json['images']).map((e)=>ImageModel.fromJson(e)).toList();
    creators = ItemsList.fromJson(json['creators']);
    characters = ItemsList.fromJson(json['characters']);
    stories = ItemsList.fromJson(json['stories']);
    events = ItemsList.fromJson(json['events']);
  }
}