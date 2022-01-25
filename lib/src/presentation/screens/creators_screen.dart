import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/creator.dart';
import 'package:personal_library/src/presentation/cards/creator_card.dart';
import 'package:personal_library/src/data/datasource/marvel_api_facade.dart';
import 'package:personal_library/src/presentation/cards/search_card.dart';
import 'package:personal_library/src/presentation/routes/hero_dialog_route.dart';

class CreatorsScreen extends StatefulWidget {
  const CreatorsScreen({Key? key}) : super(key: key);
  @override
  _CreatorsState createState() => _CreatorsState();
}

class _CreatorsState extends State<CreatorsScreen> {

  List<Widget> _creatorsWidgets = [];

  void _getWidgetList({String? text}) async {
    List<Creator> creators = await MarvelApiFacade.getCreatorsList(name: text);

    if (creators.isNotEmpty) {
      setState(() {
        List<Widget> widgets = [];
        for (var creator in creators){
          widgets.add(CreatorWidget(creator));
        }
        _creatorsWidgets = widgets;
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
        body: ListView(children: _creatorsWidgets)
    );
  }
}

