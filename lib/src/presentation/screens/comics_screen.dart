import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/presentation/cards/comic_card.dart';
import 'package:personal_library/src/data/datasource/marvel_api_facade.dart';
import 'package:personal_library/src/presentation/cards/search_card.dart';
import 'package:personal_library/src/presentation/routes/hero_dialog_route.dart';

class ComicsScreen extends StatefulWidget {

  late final Future<List<Comic>> comics;
  late final bool withComics;

  ComicsScreen({Key? key}) : super(key: key){
    withComics = false;
  }
  ComicsScreen.withComics(this.comics, {Key? key}) : super(key: key) {
    withComics = true;
  }

  @override
  _ComicsScreenState createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {

  List<Widget> _comicsWidgets = [];
  late Future<List<Comic>> _futureComics;

  void _getWidgetList({String? text}) async {
    if (widget.withComics) {
      _futureComics = widget.comics;
    }
    else {
      _futureComics = MarvelApiFacade.getComicsList(title: text);
    }

    var comics = await _futureComics;

    if (comics.isNotEmpty) {
      setState(() {
        List<Widget> widgets = [];
        for (var comic in comics){
          widgets.add(ComicWidget(comic));
        }
        _comicsWidgets = widgets;
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
    return FutureBuilder(
        future: _futureComics,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            return Scaffold(
                backgroundColor: Colors.transparent,
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
                body: ListView(children: _comicsWidgets)
            );
          }
          return const Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Text('Loading...'),
            ),
          );
      },
    );
  }
}

