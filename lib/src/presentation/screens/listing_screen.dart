import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_library/src/data/datasource/realtime_database_facade.dart';
import 'package:personal_library/src/domain/entities/listing.dart';
import 'package:personal_library/src/presentation/cards/add_listing_card.dart';

import '../cards/listing_card.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({Key? key}) : super(key: key);

  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {

  List<Widget> listingWidgets = [];

  void _getWidgetList() async {
    List<Listing> listings = await RealtimeDatabaseFacade.getListings(FirebaseAuth.instance.currentUser?.uid);
    if (listings.isNotEmpty) {
      setState(() {
        List<Widget> widgets = [];
        for (var listing in listings){
          widgets.add(ListingWidget(listing));
        }
        listingWidgets = widgets;
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
    return Column(
      children: [
        StreamBuilder(
          stream: RealtimeDatabaseFacade.getDatabaseStream(),
          builder: (context, snapshot) {
            _getWidgetList();
            return Expanded(
              child: ListView(
                children: listingWidgets,
              ),
            );
          }
        ),
        const AddListingCard(),
      ],
    );
  }
}
