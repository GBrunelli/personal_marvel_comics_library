import 'package:firebase_database/firebase_database.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/domain/entities/listing.dart';

class RealtimeDatabaseFacade{
  static final DatabaseReference _database = FirebaseDatabase.instance.ref();

  static getDatabaseStream(){
    return _database.onValue;
  }

  static Future<List<Listing>> getListings(String? userId) async {
    List<Listing> listings = [];
    var resultQuery = await _database.child('$userId').get();
    if (resultQuery.value == null) {
      return listings;
    }
    var data = resultQuery.value as Map<dynamic, dynamic>;
    for (var entry in data.entries){
      var foundListing = Listing(entry.key);
      var comics = entry.value as Map<dynamic, dynamic>;
      for (var comicsEntry in comics.entries){
        try {
          foundListing.comics.add(
            Comic(int.parse(comicsEntry.key),
                comicsEntry.value['title'] ?? '',
                comicsEntry.value['creator'] ?? '',
                comicsEntry.value['description'] ?? '',
                comicsEntry.value['series'] ?? '',
                comicsEntry.value['listing'] ?? '',
                comicsEntry.value['numberOfListings'] ?? 0,
                comicsEntry.value['isbn'] ?? '',
                comicsEntry.value['numberOfPages'] ?? '',
                comicsEntry.value['favoriteListings'] ?? 0,
                comicsEntry.value['thumbUrl'] ?? '',
                comicsEntry.value['thumbExtension'] ?? '',
            )
          );
        }
        catch (e) {
          print(e);
        }
      }
      listings.add(foundListing);
    }
    return listings;
  }

  static addBookToListing(String? userId, String listing, Comic comic){
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
    _database.child('$userId/$listing/${comic.id}').update(comicMap);
  }

  static addListing(String? userId, String? listing) {
    if ((userId == null) || (listing == null)) return;
    var user = _database.child('$userId/$listing');
    user.update({'description': ''});
    // user.child('description').remove();
  }
}
