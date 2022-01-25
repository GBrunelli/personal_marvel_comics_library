import 'package:flutter/material.dart';
import 'package:personal_library/src/presentation/cards/character_card.dart';
import 'package:personal_library/src/domain/entities/character.dart';
import 'package:personal_library/src/data/datasource/marvel_api_facade.dart';
import 'package:personal_library/src/presentation/cards/search_card.dart';
import 'package:personal_library/src/presentation/routes/hero_dialog_route.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharactersScreen> {

  List<Widget> _charactersWidgets = [];

  void _getWidgetList({String? text}) async {
    List<Character> characters = await MarvelApiFacade.getCharactersList(name: text);
    if (characters.isNotEmpty) {
      setState(() {
        List<Widget> widgets = [];
        for (var character in characters){
          widgets.add(CharacterWidget(character));
        }
        _charactersWidgets = widgets;
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
      floatingActionButton:
        FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(HeroDialogRoute(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(50),
                  child: SearchCard(
                    onTextChange: (String value) => setState(() {
                      _getWidgetList(text: value);
                    })
                  )
                );
              },
            ));
          },
          backgroundColor: Colors.blueGrey,
          label: Row(
            children: const [
              Icon(Icons.search),
              Text('Search'),
            ],
          )
        ),
      body: ListView(children: _charactersWidgets)
    );
  }
}

