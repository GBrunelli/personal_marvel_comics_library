import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_library/src/data/datasource/realtime_database_facade.dart';
import 'package:personal_library/src/domain/entities/listing.dart';
import 'package:personal_library/src/presentation/cards/add_listing_card.dart';

import '../cards/listing_card.dart';

class ListingScreen extends StatefulWidget {
  ListingScreen({Key? key}) : super(key: key);

  List<Widget> listingWidgets = [];

  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {

  void _getWidgetList() async {
    List<Listing> comics = await RealtimeDatabaseFacade.getListings(FirebaseAuth.instance.currentUser?.uid);
    if (comics.isNotEmpty) {
      setState(() {
        List<Widget> widgets = [];
        for (var comic in comics){
          widgets.add(ListingWidget(comic));
        }
        widget.listingWidgets = widgets;
        widget.listingWidgets.add(const AddListingCard());
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
    return ListView(
      children:
      widget.listingWidgets,
    );
    //   Scaffold(
    //   body: Center(
    //     child: Column(
    //       children: [
    //         MaterialButton(
    //           onPressed: () {
    //             FirebaseAuth.instance.signOut();
    //           },
    //           child: const Text('Log Out'),
    //         ),
    //         MaterialButton(
    //           onPressed: () {
    //             _addListing();
    //           },
    //           child: const Text('Add Listing'),
    //         ),
    //       ],
    //     )
    //   ),
    // );
  }
}
