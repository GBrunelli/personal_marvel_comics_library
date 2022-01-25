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

  static Future<List<Character>> getCharactersList({String? name}) async {
    Uri request;
    if (name == null) {
      request = Uri.https(baseUrl, baseRoute + '/characters',
          {'apikey': apiKey, 'ts': ts, 'hash': hash});
    }
    else {
      request = Uri.https(baseUrl, baseRoute + '/characters',
          {'apikey': apiKey, 'ts': ts, 'hash': hash, 'nameStartsWith': name});
    }

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

  static Future<List<Comic>> getComicListByCreator({required int creatorId}) async {
    Uri request = Uri.https(baseUrl, baseRoute + '/creators/$creatorId/comics',
        {'apikey': apiKey, 'ts': ts, 'hash': hash});
    return await _requestToComicList(request);
  }

  static Future<List<Comic>> getComicsListByCharacter({required int characterId}) async {
    Uri request = Uri.https(baseUrl, baseRoute + '/characters/$characterId/comics',
        {'apikey': apiKey, 'ts': ts, 'hash': hash});
    return await _requestToComicList(request);
  }

  static Future<List<Comic>> getComicsList({String? title, int? characterId}) async {
    Uri request;
    if(title == null){
      request = Uri.https(baseUrl, baseRoute + '/comics',
          {'apikey': apiKey, 'ts': ts, 'hash': hash});
    }
    else {
      request = Uri.https(baseUrl, baseRoute + '/comics',
          {'apikey': apiKey, 'ts': ts, 'hash': hash, 'titleStartsWith': title});
    }
    return await _requestToComicList(request);
  }

  static Future<List<Comic>> _requestToComicList(Uri request) async {
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
        comic.description,
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

  static Future<List<Creator>> getCreatorsList({String? name}) async {
    Uri request;
    if (name == null){
      request = Uri.https(baseUrl, baseRoute + '/creators',
          {'apikey': apiKey, 'ts': ts, 'hash': hash});
    }
    else {
      request = Uri.https(baseUrl, baseRoute + '/creators',
          {'apikey': apiKey, 'ts': ts, 'hash': hash, 'nameStartsWith': name});
    }

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