import 'dart:convert';
import 'package:http/http.dart';
import 'package:personal_library/src/core/utils/constants.dart';
import 'package:personal_library/src/data/models/character_model.dart';
import 'package:personal_library/src/data/models/comic_model.dart';
import 'package:personal_library/src/data/models/creator_model.dart';
import 'package:personal_library/src/data/models/data_wrapper.dart';
import 'package:personal_library/src/domain/entities/character.dart';
import 'package:personal_library/src/domain/entities/comic.dart';
import 'package:personal_library/src/domain/entities/creator.dart';

abstract class MarvelApiFacade {
  static Future<List<Character>> getCharactersList() async {
    Uri request = Uri.https(baseUrl, baseRoute + '/characters',
        {'apikey': apiKey, 'ts': ts, 'hash': hash});
    Response res = await get(request);
    var wrapper = DataWrapper<CharacterModel>.fromJson(jsonDecode(res.body), CharacterModel.fromJson);

    List<Character> characters = [];
    for (var character in wrapper.data.result){
      characters.add(Character(
          character.id,
          character.name,
          character.comics.items.length,
          0, // TODO: link with user data
          character.thumbnail.path,
          character.thumbnail.extension
      ));
    }
    return characters;
  }

  static Future<List<Comic>> getComicsList() async {
    Uri request = Uri.https(baseUrl, baseRoute + '/comics',
        {'apikey': apiKey, 'ts': ts, 'hash': hash});
    Response res = await get(request);
    var wrapper = DataWrapper<ComicModel>.fromJson(jsonDecode(res.body), ComicModel.fromJson);

    List<Comic> comics = [];
    for (var comic in wrapper.data.result){
      String creators = '';
      for (var creator in comic.creators.items){
        creators += creator.name + ' ';
      }
      comics.add(Comic(
        comic.id,
        comic.title,
        creators,
        comic.series.name,
        '', // TODO: link with user data - name listing
        0, // TODO: link with user data - number of listing
        comic.isbn,
        comic.pageCount,
        0, // TODO: link with user data - number of favorites
        comic.thumbnail.path,
        comic.thumbnail.extension
      ));
    }
    return comics;
  }

  static Future<List<Creator>> getCreatorsList() async {
    Uri request = Uri.https(baseUrl, baseRoute + '/creators',
        {'apikey': apiKey, 'ts': ts, 'hash': hash});
    Response res = await get(request);
    var wrapper = DataWrapper<CreatorModel>.fromJson(jsonDecode(res.body), CreatorModel.fromJson);

    List<Creator> creators = [];
    for (var creator in wrapper.data.result){
      creators.add(Creator(
        creator.id,
        creator.fullName,
        creator.comics.items.length,
        0, // TODO: link with user data
        creator.thumbnail.path,
        creator.thumbnail.extension
      ));
    }
    return creators;
  }
}