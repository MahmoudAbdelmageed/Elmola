import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/categories_model.dart';
import '../model/kind_model.dart';
import '../model/searchModel.dart';

class ApiProvider {
  String pathUrl = "https://www.hotlinesegypt.com/wp-json/wp/v2";
  var getCat;
  var getSearchs;

  var getKind;

  Future<List<Categories>> getCategories(lang) async {
    var url = Uri.parse(pathUrl + '/listing-category/?_embed&per_page=100&wpml_language=$lang');

    getCat = await http.get(
      url
        );
    return [];
  }

  Future<List<SerachingModel>> getSearch({lang, text}) async {
    var url = Uri.parse(pathUrl +
        '/search?search=$text&subtype=listing&_embed&wpml_language=$lang');

    getSearchs = await http.get(url);
    return [];
  }

  Future<List<Kind>> getK({pageNumber, id, lang}) async {
    var url = Uri.parse('https://www.hotlinesegypt.com/wp-json/wp/v2/listing?listing-category=$id&wpml_language=$lang&_embed&page=$pageNumber');

    getKind = await http.get(url);
    if (getKind.statusCode == 200) {
      var resopnce = json.decode(getKind.body);
      List<Kind> kind = [];
      for (var item in resopnce) {
        kind.add(Kind.fromJson(item));
      }
      return kind;
    } else {
      print("error");
    }
    return [];
  }

}
