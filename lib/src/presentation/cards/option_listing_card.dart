import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/listing.dart';
import 'package:personal_library/src/presentation/routes/hero_dialog_route.dart';
import 'package:personal_library/src/presentation/screens/comics_screen.dart';

class OptionListingWidget extends StatefulWidget {

  final Listing listing;

  const OptionListingWidget(this.listing, {Key? key}) : super(key: key);

  @override
  _OptionListingWidgetState createState() => _OptionListingWidgetState();
}

class _OptionListingWidgetState extends State<OptionListingWidget> {

  @override
  Widget build(BuildContext context) {
    return
      Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          height: 100,
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
      );
  }
}
