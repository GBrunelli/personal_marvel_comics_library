import 'package:personal_library/src/domain/entities/marvel_entity.dart';

class Creator extends MarvelEntity{
  Creator(
      int id,
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