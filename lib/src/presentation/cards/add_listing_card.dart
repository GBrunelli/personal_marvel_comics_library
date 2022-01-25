import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_library/src/data/datasource/realtime_database_facade.dart';

class AddListingCard extends StatefulWidget {
  const AddListingCard({Key? key}) : super(key: key);

  @override
  _AddListingCardState createState() => _AddListingCardState();
}

class _AddListingCardState extends State<AddListingCard> {

  void _addListing(){
    RealtimeDatabaseFacade.addListing(FirebaseAuth.instance.currentUser?.uid, _listingName, '');
  }

  late String _listingName;
  late Widget _clickToAdd, _selectName;
  late Widget _currentWidget;

  _changeToInput(){
    setState(() {
      _currentWidget = _selectName;
    });
  }

  _changeToAdd(){
    setState(() {
      _currentWidget = _clickToAdd;
    });
  }

  @override
  void initState() {
    _selectName =
    GestureDetector(
        onTap: () {
          // _changeToAdd();
        },
        child: Material(
          color: Colors.blueGrey,
          elevation: 4,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: TextFormField(
              onChanged: (value){
                _listingName = value;
              },
              onFieldSubmitted: (value) {
                _addListing();
                _changeToAdd();
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hoverColor: Colors.white,
                focusColor: Colors.white
              ),
            ),
          )
        )
    );

    _clickToAdd =
    GestureDetector(
        onTap: () {
          _changeToInput();
        },
        child: Material(
            color: Colors.blueGrey,
            elevation: 4,
            borderRadius: BorderRadius.circular(20),
            child:  const Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                )
            )
        )
    );

    _currentWidget = _clickToAdd;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      height: 60,
      child: _currentWidget
    );
  }
}
