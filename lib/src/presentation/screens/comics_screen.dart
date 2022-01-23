import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/domain/entities/creator.dart';
import 'package:personal_library/src/presentation/cards/character_card.dart';
import 'package:personal_library/src/domain/entities/character.dart';
import 'package:personal_library/src/presentation/cards/comic_card.dart';
import 'package:personal_library/src/presentation/cards/creator_card.dart';
import 'package:personal_library/src/data/datasource/marvel_api_facade.dart';

class ComicsScreen extends StatefulWidget {

  List<Widget> comicsWidgets = [];

  @override
  _ComicsScreenState createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {

  void _getWidgetList() async {
    List<Comic> comics = await MarvelApiFacade.getComicsList();

    if (comics.isNotEmpty) {
      setState(() {
        List<Widget> widgets = [];
        for (var comic in comics){
          widgets.add(ComicWidget(comic));
        }
        widget.comicsWidgets = widgets;
      });
    }
  }

  @override
  void initState() {
    _getWidgetList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: widget.comicsWidgets);
  }
}

