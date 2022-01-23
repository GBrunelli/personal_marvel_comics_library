import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/comic.dart';

class ComicDetailedWidget extends StatefulWidget {

  final Comic comic;

  const ComicDetailedWidget(this.comic, {Key? key}) : super(key: key);

  @override
  _ComicDetailedWidgetState createState() => _ComicDetailedWidgetState();
}

class _ComicDetailedWidgetState extends State<ComicDetailedWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => , call detailed screen
      child: Hero(
        tag : 'show_detailed_comic',
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 100, bottom: 100, left: 10, right: 10),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column (
            children: [
              Container(
                  padding: EdgeInsets.all(15),
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(widget.comic.incredibleLandscapeThumb),
                  )
              ),
              Row(
                children: [
                  Expanded (
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(widget.comic.title, style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.center,),
                          Text(widget.comic.series, style: Theme.of(context).textTheme.headline3),
                          Text(widget.comic.creator, style: Theme.of(context).textTheme.headline4)
                        ],
                      )
                  ),
                ],
              ),
              Text('${widget.comic.favoriteListings} Favoritos', style: Theme.of(context).textTheme.headline4)
            ],
          ),
        ),
      ),
    );
  }
}