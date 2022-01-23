import 'package:personal_library/src/domain/entities/marvel_entity.dart';

class Character extends MarvelEntity {
  Character(int id,
      this.name,
      this.numberHQs,
      this.savedHQs,
      String thumbBaseUrl,
      String imageExtension) :
        super(id, thumbBaseUrl, imageExtension);

  String name;
  int numberHQs;
  int savedHQs;
}