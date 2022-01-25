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
            margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: Material(
            elevation: 4,
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            child: Column (
              children: [
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(15),
                        child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(widget.comic.mediumPortraitThumb),
                        )
                    ),
                    Expanded (
                        child: Container(
                          padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(widget.comic.title, style: Theme.of(context).textTheme.headline2, textScaleFactor: .4),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(widget.comic.series, style: Theme.of(context).textTheme.headline3, textScaleFactor: .4),
                              ),
                              Text(widget.comic.creator, style: Theme.of(context).textTheme.headline4, textScaleFactor: .4)
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}

