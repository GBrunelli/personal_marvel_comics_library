import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_library/src/data/datasource/realtime_database_facade.dart';
import 'package:personal_library/src/domain/entities/listing.dart';
import 'package:personal_library/src/domain/entities/comic.dart';

import '../cards/listing_card.dart';

class SelectListing extends StatefulWidget {
  const SelectListing(this.comic, {Key? key}) : super(key: key);

  final Comic comic;

  @override
  _SelectListingState createState() => _SelectListingState();
}

class _SelectListingState extends State<SelectListing> {
  List<Widget> _listings = [];

  void _addBook(String listing){
    RealtimeDatabaseFacade.addBookToListing(FirebaseAuth.instance.currentUser?.uid, listing, widget.comic);
  }

  void _getWidgetList() async {
    List<Listing> listings = await RealtimeDatabaseFacade.getListings(FirebaseAuth.instance.currentUser?.uid);
    if (listings.isNotEmpty) {
      setState(() {
        List<Widget> widgets = [];
        for (var listing in listings){
          widgets.add(
            GestureDetector(
              onTap: () {
                _addBook(listing.name);
                Navigator.pop(context);
              },
              child: ListingWidget(listing),
            )
          );
        }
        _listings = widgets;
      });
    }
  }

  @override
  void initState() {
    _getWidgetList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          children: _listings
        )
      ),
    );
  }
}
