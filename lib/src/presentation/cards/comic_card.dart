import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/presentation/cards/comic_detailed_card.dart';
import 'package:personal_library/src/presentation/routes/hero_dialog_route.dart';

class ComicWidget extends StatefulWidget {

  final Comic comic;

  const ComicWidget(this.comic, {Key? key}) : super(key: key);

  @override
  _ComicWidgetState createState() => _ComicWidgetState();
}

class _ComicWidgetState extends State<ComicWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(HeroDialogRoute(
          builder: (context) {
            return ComicDetailedWidget(widget.comic);
          },
        ));
      },
      child: Hero(
        tag : 'show_detailed_comic',
        child: Container(
          height: 220,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column (
            children: [
              Row(
                children: [
                  Container(
                      width: 130,
                      padding: EdgeInsets.all(15),
                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(widget.comic.mediumPortraitThumb),
                      )
                  ),
                  Expanded (
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.comic.title, style: Theme.of(context).textTheme.headline2, textScaleFactor: .5),
                          Text(widget.comic.series, style: Theme.of(context).textTheme.headline3, textScaleFactor: .5),
                          Text(widget.comic.creator, style: Theme.of(context).textTheme.headline4, textScaleFactor: .5)
                        ],
                      )
                  ),
                ],
              ),
              Text('${widget.comic.favoriteListings} Favoritos', style: Theme.of(context).textTheme.headline4, textScaleFactor: .5)
            ],
          ),
        ),
      ),
    );
  }
}

