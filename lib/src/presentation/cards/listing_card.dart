import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/listing.dart';

class ListingWidget extends StatefulWidget {

  final Listing listing;

  const ListingWidget(this.listing, {Key? key}) : super(key: key);

  @override
  _ListingWidgetState createState() => _ListingWidgetState();
}

class _ListingWidgetState extends State<ListingWidget> {

  // _view_detailed(BuildContext context){
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => ComicWidget())
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => _view_detailed(context),
        child: Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          height: 120,
          child: Material(
            color: Colors.grey,
            elevation: 4,
            borderRadius: BorderRadius.circular(20),
            child:  Center(
              child: Text(
                  widget.listing.name,
                  style: Theme.of(context).textTheme.headline2,
                  textScaleFactor: .5),
            )
          ),
        )
    );
  }
}
