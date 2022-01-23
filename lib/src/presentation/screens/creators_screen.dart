import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/domain/entities/creator.dart';
import 'package:personal_library/src/presentation/cards/character_card.dart';
import 'package:personal_library/src/domain/entities/character.dart';
import 'package:personal_library/src/presentation/cards/comic_card.dart';
import 'package:personal_library/src/presentation/cards/creator_card.dart';
import 'package:personal_library/src/data/datasource/marvel_api_facade.dart';

class CreatorsScreen extends StatefulWidget {

  List<Widget> creatorsWidgets = [];

  @override
  _CreatorsState createState() => _CreatorsState();
}

class _CreatorsState extends State<CreatorsScreen> {

  void _getWidgetList() async {
    List<Creator> creators = await MarvelApiFacade.getCreatorsList();

    if (creators.isNotEmpty) {
      setState(() {
        List<Widget> widgets = [];
        for (var creator in creators){
          widgets.add(CreatorWidget(creator));
        }
        widget.creatorsWidgets = widgets;
      });
    }
  }

  @override
  void initState() {
    _getWidgetList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: widget.creatorsWidgets);
  }
}

