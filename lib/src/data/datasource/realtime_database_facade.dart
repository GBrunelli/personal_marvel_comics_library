import 'package:crypto/crypto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/domain/entities/listing.dart';

class RealtimeDatabaseFacade{
  static final DatabaseReference _database = FirebaseDatabase.instance.ref();

  static Future<List<Listing>> getListings(String? userId) async {
    var resultQuery = await _database.child('$userId').get();
    var data = resultQuery.value as Map<dynamic, dynamic>;
    List<Listing> listings = [];
    for (var key in data.keys){
      listings.add(Listing(key));
    }
    return listings;
  }

  static addBookToListing(String? userId, String listing, Comic comic){
    Map<String, dynamic> comicMap = {
      'title': comic.title,
      'creator': comic.creator,
      'series': comic.series,
      'listing': comic.listing,
      'numberOfListings': comic.numberOfListings,
      'isbn': comic.isbn,
      'numberOfPages': comic.numberOfPages,
      'thumbUrl': comic.thumbBaseUrl,
      'thumbExtension': comic.imageExtension
    };
    _database.child('$userId/$listing/${comic.id}').update(comicMap);
  }

  static addListing(String? userId, String? listing, String? description) {
    if ((userId == null) || (listing == null)) return;
    var user = _database.child('$userId/$listing');
    user.update({'description': description});
  }
}
