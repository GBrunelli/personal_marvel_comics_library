import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/domain/entities/creator.dart';
import 'package:personal_library/src/presentation/cards/character_card.dart';
import 'package:personal_library/src/domain/entities/character.dart';
import 'package:personal_library/src/presentation/cards/comic_card.dart';
import 'package:personal_library/src/presentation/cards/creator_card.dart';
import 'package:personal_library/src/data/datasource/marvel_api_facade.dart';

class CharactersScreen extends StatefulWidget {

  List<Widget> charactersWidgets = [];

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharactersScreen> {

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
    return ListView(children: widget.charactersWidgets);
  }
}

