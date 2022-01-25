import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/listing.dart';
import 'package:personal_library/src/presentation/routes/hero_dialog_route.dart';
import 'package:personal_library/src/presentation/screens/comics_screen.dart';

class ListingWidget extends StatefulWidget {

  final Listing listing;

  const ListingWidget(this.listing, {Key? key}) : super(key: key);

  @override
  _ListingWidgetState createState() => _ListingWidgetState();
}

class _ListingWidgetState extends State<ListingWidget> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(HeroDialogRoute(
          builder: (context) {
            return Container(
              color: Colors.black54,
              padding : const EdgeInsets.only(top: 50, right: 10, left: 10),
              child : Column(
                children: [
                  Material(
                    color: Colors.blueGrey,
                    elevation: 4,
                    borderRadius: BorderRadius.circular(20),
                    child:  Center(
                      child: Text(
                          widget.listing.name,
                          style: Theme.of(context).textTheme.headline2,
                          textScaleFactor: .5),
                    )
                  ),
                  Expanded(
                      child: ComicsScreen.withComics(widget.listing.comics)
                  )
                ],
              ),
            );
          },
        ));
      },
        child: Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
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
