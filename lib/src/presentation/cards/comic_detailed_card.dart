import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/presentation/screens/select_listing_screen.dart';
import 'package:personal_library/src/presentation/routes/hero_dialog_route.dart';

class ComicDetailedWidget extends StatefulWidget {

  final Comic comic;

  const ComicDetailedWidget(this.comic, {Key? key}) : super(key: key);

  @override
  _ComicDetailedWidgetState createState() => _ComicDetailedWidgetState();
}

class _ComicDetailedWidgetState extends State<ComicDetailedWidget> {

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag : 'show_detailed_comic',
      child:
      Container(
        constraints: const BoxConstraints(maxWidth: 600),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 80, bottom: 100, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20)
        ),
        child: ListView (
          children: [
            Container(
                padding: const EdgeInsets.all(15),
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
                        Text(
                          widget.comic.title,
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.center,
                          textScaleFactor: .7,
                        ),
                        Text(widget.comic.creator,
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.center,
                          textScaleFactor: .7,
                        ),
                      ],
                    )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:20),
              child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Descrição: ${widget.comic.description}',
                      style: Theme.of(context).textTheme.headline5,
                      textScaleFactor: .7,
                    ),
                    Text('ISBN: ${widget.comic.isbn}',
                      style: Theme.of(context).textTheme.headline5,
                      textScaleFactor: .7,
                    ),
                    Text('Pages: ${widget.comic.numberOfPages}',
                      style: Theme.of(context).textTheme.headline5,
                      textScaleFactor: .7,
                    ),
                    Text('Listas: ${widget.comic.numberOfListings}',
                      style: Theme.of(context).textTheme.headline5,
                      textScaleFactor: .7,
                    ),
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton (
                  onPressed: () {
                    Navigator.of(context).push(HeroDialogRoute(
                      builder: (context) {
                        return SelectListing(widget.comic);
                      },
                    ));
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  elevation: 4,
                  child: const Icon(
                    Icons.save
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}