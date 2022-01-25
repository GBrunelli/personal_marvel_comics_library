import 'package:firebase_database/firebase_database.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/domain/entities/listing.dart';

class RealtimeDatabaseFacade{
  static final DatabaseReference _database = FirebaseDatabase.instance.ref();

  static getDatabaseStream(){
    return _database.onValue;
  }

  static Future<Comic?> getComic(int comicId) async {
    DataSnapshot a = await _database.child('$comicId').get();
    if (a.value != null){
      Map<dynamic, dynamic> foundComic = a.value as Map<dynamic, dynamic>;
      String? sKey = a.key;
      if (sKey != null) {
        return _generateComicFromMap(int.parse(sKey), foundComic);
      }
    }
    return null;
  }

  static Future<List<Listing>> getListings(String? userId) async {
    List<Listing> listings = [];
    DataSnapshot resultQuery = await _database.child('$userId').get();
    if (resultQuery.value == null) {
      return listings;
    }

    Map<dynamic, dynamic> data = resultQuery.value as Map<dynamic, dynamic>;
    for (var entry in data.entries){

      Listing foundListing = Listing(entry.key);

      Map<dynamic, dynamic> comics = {};

      try {
        comics = entry.value['comics'] as Map<dynamic, dynamic>;
      }
      catch (e) {}

      for (var comicsEntry in comics.entries){

        String comicPath;

        try {
          comicPath = '${int.parse(comicsEntry.key)}';
        }
        catch (e){
          continue;
        }

        DataSnapshot foundComicSnapshot = await _database.child(comicPath).get();

        if (foundComicSnapshot.value != null) {
          Map<dynamic, dynamic> foundComicData = foundComicSnapshot.value as Map<dynamic, dynamic>;
          try {
            foundListing.comics.add(_generateComicFromMap(int.parse(comicsEntry.key), foundComicData));
            //     Comic(int.parse(comicsEntry.key),
            //       foundComicData['title'] ?? '',
            //       foundComicData['creator'] ?? '',
            //       foundComicData['description'] ?? '',
            //       foundComicData['series'] ?? '',
            //       foundComicData['listing'] ?? '',
            //       foundComicData['numberOfListings'] ?? 0,
            //       foundComicData['isbn'] ?? '',
            //       foundComicData['numberOfPages'] ?? '',
            //       foundComicData['favoriteListings'] ?? 0,
            //       foundComicData['thumbUrl'] ?? '',
            //       foundComicData['thumbExtension'] ?? '',
            //     )
            // );
          }
          catch (e) {
            print(e);
          }
        }
      }
      listings.add(foundListing);
    }
    return listings;
  }

  static Comic _generateComicFromMap(int id, Map<dynamic, dynamic> values){
    return Comic(id,
      values['title'] ?? '',
      values['creator'] ?? '',
      values['description'] ?? '',
      values['series'] ?? '',
      values['listing'] ?? '',
      values['numberOfListings'] ?? 0,
      values['isbn'] ?? '',
      values['numberOfPages'] ?? '',
      values['favoriteListings'] ?? 0,
      values['thumbUrl'] ?? '',
      values['thumbExtension'] ?? '',
    );
  }

  static Map<String, dynamic> _generateMapFromComic(Comic comic) {
    Map<String, dynamic> comicMap = {
      'title': comic.title,
      'creator': comic.creator,
      'description': comic.description,
      'series': comic.series,
      'listing': comic.listing,
      'numberOfListings': comic.numberOfListings,
      'isbn': comic.isbn,
      'numberOfPages': comic.numberOfPages,
      'favoriteListings': comic.favoriteListings,
      'thumbUrl': comic.thumbBaseUrl,
      'thumbExtension': comic.imageExtension
    };
    return comicMap;
  }

  static Future<Listing?> getListing(String userId, String listingName) async {
    List<Listing> listings = await getListings(userId);
    for (var listing in listings){
      if(listing.name == listingName) {
        return listing;
      }
    }
    return null;
  }

  static Future<bool> comicInListing(String userId, int comicId, String listingName) async {
    Listing? listing = await getListing(userId, listingName);
    if(listing != null){
      for (Comic c in listing.comics){
        if (c.id == comicId){
          return true;
        }
      }
    }
    return false;
  }

  static addBookToListing(String? userId, String listingName, Comic comic) async{
    if(userId == null) return;

    String comicPathInListing = '$userId/$listingName/comics/${comic.id}';
    String comicPath = '${comic.id}';

    Map<String, dynamic> comicMap = _generateMapFromComic(comic);

    DataSnapshot comicFoundSnapshot = await _database.child(comicPath).get();

    if (comicFoundSnapshot.value == null){
      comicMap['listing'] = listingName;
      comicMap['numberOfListings'] = 1;
    }
    else {
      Map<dynamic, dynamic> comicFound = comicFoundSnapshot.value as Map<dynamic, dynamic>;
      if (! await comicInListing(userId, comic.id, listingName)){
        comicMap['numberOfListings'] = comicFound['numberOfListings'] + 1;
      }
      else {
        return;
      }
    }

    _database.child(comicPath).update(comicMap);
    _database.child(comicPathInListing).update(comicMap);
  }

  static addListing(String? userId, String? listing) {
    if ((userId == null) || (listing == null)) return;
    var user = _database.child('$userId/$listing');
    user.update({'description': ''});
  }
}
