import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/creator.dart';
import 'package:personal_library/src/presentation/cards/comic_card.dart';

class CreatorCard extends StatefulWidget {

  final Creator creator;

  const CreatorCard(this.creator, {Key? key}) : super(key: key);

  @override
  _CreatorCardState createState() => _CreatorCardState();
}

class _CreatorCardState extends State<CreatorCard> {

  // _view_detailed(BuildContext context){
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => ComicWidget())
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => _view_detailed(context),
      child: Container(
        height: 170,
        margin: EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft:  Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft:  Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            )
        ),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 130,
                  padding: EdgeInsets.all(15),
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(widget.creator.mediumStandardThumb),
                  )
              ),
                Text(widget.creator.name, style: Theme.of(context).textTheme.headline2, textScaleFactor: .5)
              ],
            ),
            Row(
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
          ],
        ),
      ),
    );
  }
}
