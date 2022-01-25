import 'package:flutter/material.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({Key? key, required this.onTextChange}) : super(key: key);
  final Function(String) onTextChange;
  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search_character',
      child: Center(
        child: SizedBox(
          height: 120,
          child: Material(
            elevation: 4,
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right:20, left: 20),
                child: TextFormField(
                  onFieldSubmitted: (value){
                    widget.onTextChange(value);
                    Navigator.pop(context);
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Search Keyword',
                  ),
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
