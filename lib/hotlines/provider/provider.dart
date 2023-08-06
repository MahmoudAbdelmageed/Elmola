import 'dart:async';
import 'dart:convert';

import 'package:el_mola/hotlines/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../homePage.dart';
import '../model/categories_model.dart';
import '../model/kind_model.dart';
import '../model/searchModel.dart';

class App extends ChangeNotifier {
  static App get(context) => Provider.of(context, listen: false);
  //to call this function once and on the first on app start
  App() {
    fetchCategories();
  }

  List<Categories> artical_object =  [];
  List<Kind> kind_object =  [];
  List<SerachingModel> search_object =  [];

  bool _isFetchingArticals = false;
  bool _isFetchingKind = false;
  bool _isFetchingSearch = false;

  var articalResponce = "";
  var kindResponce = "";
  var searchResponce = "";

  bool get isFetchingArticals => _isFetchingArticals;
  bool get isFetchingKind => _isFetchingKind;
  bool get isFetchingSearch => _isFetchingSearch;

  TextEditingController _controller = new TextEditingController();
  TextEditingController get controller => _controller;

  String _inputText = "";
  String get inputText => _inputText;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  //list for search to add all categories on it

  changeLange() {
    artical_object.clear();
    //  fetchCategories();
    notifyListeners();
  }

//get all categories
  fetchCategories() async {
    ApiProvider request = new ApiProvider();
    _isFetchingArticals = false;
    await request
        .getCategories("ar");
    if (request.getCat.statusCode == 200) {
      _isFetchingArticals = true;
      List<dynamic> artical =  [];
      articalResponce = request.getCat.body;
      artical = json.decode(request.getCat.body);
      if (artical.length > 0) {
        for (int i = 0; i < artical.length; i++) {
          if (artical[i] != null) {
            Map<String, dynamic> map = artical[i];
            artical_object.add(Categories.fromJson(map));
          }
        }
      }
    } else {
      _isFetchingArticals = false;
      print("error");
    }
    notifyListeners();
  }

  ///get all search
  fetchSearch() async {
    ApiProvider request = new ApiProvider();
    _isFetchingSearch = false;
    await request.getSearch(lang: "ar", text: _inputText);
    if (request.getSearchs.statusCode == 200) {
      search_object.clear();
      _isFetchingSearch = true;
      List<dynamic> searchItem = [
      ];
      searchResponce = request.getSearchs.body;
      searchItem = json.decode(request.getSearchs.body);
      if (searchItem.length > 0) {
        for (int i = 0; i < searchItem.length; i++) {
          if (searchItem[i] != null) {
            Map<String, dynamic> map = searchItem[i];
            search_object.add(SerachingModel.fromJson(map));
          }
        }
      }
    } else {
      _isFetchingSearch = false;
      print("error");
    }
    notifyListeners();
  }

//icon lancher function
  void customLaunch(command) async {
    try{
      launch(command);
    }catch(e){
      print(' could not launch $command');
    }
    if (await canLaunch(command)) {
      await launch(command);
    } else {

    }
  }

//share function
  onShare(BuildContext context, text) async {
    await Share.share(text);
  }

//spalsh timer function and call the navigat function
  spalshNavigate(context) {
    Timer(
        Duration(seconds: 3), () => seetboolAndNavigate(context, MyHomePageh()));
  }

//spalsh navigation function
  seetboolAndNavigate(context, route) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => route),
        (Route<dynamic> route) => false);
  }

  //set new lang
  arabiLang(BuildContext context) {
    translator.setNewLanguage(
      context,
      newLanguage:"ar",
      remember: true,
      restart: true,
    );
    notifyListeners();
  }

  englishLang(BuildContext context) {
    translator.setNewLanguage(
      context,
      newLanguage: "en",
      remember: true,
      restart: true,
    );
    notifyListeners();
  }

  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  onChangeTextFeild(newVal) {
    _inputText = _controller.text;
    notifyListeners();
  }

  clearController() {
    _controller.text = "";
    notifyListeners();
  }

  String lang = "en";

  checkEnglishLang() {
    RegExp exp = RegExp("[a-zA-Z]");
    if (exp.hasMatch(_inputText.substring(_inputText.length - 1)) &&
        _inputText.substring(inputText.length - 1) != " ") {
      lang = "en";
      notifyListeners();
    } else {
      lang = "ar";
      notifyListeners();
    }
    notifyListeners();
  }
}
