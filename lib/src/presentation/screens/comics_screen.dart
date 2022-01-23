import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/domain/entities/creator.dart';
import 'package:personal_library/src/presentation/cards/character_card.dart';
import 'package:personal_library/src/domain/entities/character.dart';
import 'package:personal_library/src/presentation/cards/comic_card.dart';
import 'package:personal_library/src/presentation/cards/creator_card.dart';
import 'package:personal_library/src/data/datasource/marvel_api_facade.dart';

class ComicsScreen extends StatefulWidget {

  List<Widget> charactersWidgets = [];

  @override
  _ComicsScreenState createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {

  void _getWidgetList() async {
    List<Character> characters = await MarvelApiFacade.getCharactersList();

    if (characters.isNotEmpty) {
      setState(() {
        List<Widget> widgets = [];
        for (var character in characters){
          widgets.add(CharacterWidget(character));
        }
        widget.charactersWidgets = widgets;
      });
    }
  }

  @override
  void initState() {
    _getWidgetList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
            child: ListView(
              children: widget.charactersWidgets,
            )
        ),
      ),
    );
  }
}

