import 'package:personal_library/src/domain/entities/marvel_entity.dart';

class Comic extends MarvelEntity{

  Comic(int id,
      this.title,
      this.creator,
      this.series,
      this.listing,
      this.numberOfListings,
      this.isbn,
      this.numberOfPages,
      //this.gallery,
      this.favoriteListings,
      String thumbBaseUrl,
      String imageExtension) :
        super(id, thumbBaseUrl, imageExtension);

  String title;
  String creator;
  String series;
  String listing;
  int numberOfListings;
  String isbn;
  int numberOfPages;
  //List<Image> gallery;
  int favoriteListings;
  
}