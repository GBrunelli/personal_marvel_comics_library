import 'package:flutter/material.dart';
import 'package:personal_library/src/data/datasource/marvel_api_facade.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/domain/entities/creator.dart';
import 'package:personal_library/src/presentation/routes/hero_dialog_route.dart';
import 'package:personal_library/src/presentation/screens/comics_screen.dart';

class CreatorWidget extends StatefulWidget {

  final Creator creator;

  const CreatorWidget(this.creator, {Key? key}) : super(key: key);

  @override
  _CreatorWidgetState createState() => _CreatorWidgetState();
}

class _CreatorWidgetState extends State<CreatorWidget> {

  late Future<List<Comic>> _comicList;
  _getCreatorComicsWidgets() async {
    _comicList = MarvelApiFacade.getComicListByCreator(creatorId: widget.creator.id);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _getCreatorComicsWidgets();
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
                            widget.creator.name,
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
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        child: Material(
          color: Colors.grey,
          elevation: 4,
          borderRadius: BorderRadius.circular(20),
          child:  Column (
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(15),
                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(widget.creator.mediumStandardThumb),
                      )
                  ),
                  Expanded(child: Text(
                      widget.creator.name,
                      style: Theme.of(context).textTheme.headline2,
                      textScaleFactor: .5)
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${widget.creator.numberHQs} Comics',
                        style: Theme.of(context).textTheme.headline4,
                        textScaleFactor: .5),
                    Text('${widget.creator.savedHQs} Favoritos',
                        style: Theme.of(context).textTheme.headline4,
                        textScaleFactor: .5)
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}
