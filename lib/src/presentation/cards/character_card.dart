import 'package:flutter/material.dart';
import 'package:personal_library/src/domain/entities/character.dart';

class CharacterWidget extends StatefulWidget {

  final Character character;

  const CharacterWidget(this.character, {Key? key}) : super(key: key);

  @override
  _CharacterWidgetState createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => , call detailed screen
      child: Container (
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: Material(
          elevation: 4,
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 170,
            child: Column (
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                        width: 130,
                        height: 130,
                        padding: EdgeInsets.all(15),
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