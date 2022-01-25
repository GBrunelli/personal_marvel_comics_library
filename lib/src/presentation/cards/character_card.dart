import 'package:flutter/material.dart';
import 'package:personal_library/src/data/datasource/marvel_api_facade.dart';
import 'package:personal_library/src/domain/entities/character.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/presentation/routes/hero_dialog_route.dart';
import 'package:personal_library/src/presentation/screens/comics_screen.dart';

class CharacterWidget extends StatefulWidget {

  final Character character;

  const CharacterWidget(this.character, {Key? key}) : super(key: key);

  @override
  _CharacterWidgetState createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {

  late List<Comic> _comicList = [];
  _getCharacterComicsWidgets() async {
      _comicList = await MarvelApiFacade.getComicsListByCharacter(characterId: widget.character.id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _getCharacterComicsWidgets();
        Navigator.of(context).push(HeroDialogRoute(
          builder: (context) {
            return Container(
              color: Colors.black54,
              padding : const EdgeInsets.only(top: 50, right: 10, left: 10),
              child : Column(
                children: [
                  Material(
                      color: Colors.blueGrey,
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child:  Center(
                        child: Text(
                            widget.character.name,
                            style: Theme.of(context).textTheme.headline2,
                            textScaleFactor: .5),
                      )
                  ),
                  Expanded(
                      child: ComicsScreen.withComics(_comicList)
                  )
                ],
              ),
            );
          },
        ));
      },
      child: Container (
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        child: Material(
          elevation: 4,
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 170,
            child: Column (
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                        width: 130,
                        height: 130,
                        padding: const EdgeInsets.all(15),
                        child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(widget.character.mediumStandardThumb),
                        )
                    ),
                    Expanded (
                        child:
                        Text(
                            widget.character.name,
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline2,
                            textScaleFactor: .5
                        )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${widget.character.numberHQs} Aparições',
                        style: Theme.of(context).textTheme.headline4,
                        textScaleFactor: .5),
                    Text('${widget.character.savedHQs} Favoritos',
                        style: Theme.of(context).textTheme.headline4,
                        textScaleFactor: .5)
                  ],
                )
              ],
            ),
          ),
        )
      )
    );
  }
}