import 'dart:convert';

import 'package:el_mola/helper/cache_helper.dart';
import 'package:el_mola/models/api_models/home_model.dart';
import 'package:flutter/material.dart';

import '../helper/http_helper.dart';
import 'dart:developer';

import '../models/api_models/book_details_model.dart';
import '../models/api_models/book_model.dart';
import '../models/api_models/product_details_model.dart';
import '../models/api_models/product_model.dart';
import '../models/api_models/status_model.dart';
import '../vars.dart';

class ApiProvider with ChangeNotifier {
  late StatusModel statusObject;
  Future getAppStatus() async {
    await HttpHelper.getData(
      urlPath: "https://mulla.hwzn.sa/project/public/api/publishStatus",
    ).then((value) {
      log(value.body);
      if (value.statusCode == 200) {
        statusObject = StatusModel.fromJson(json.decode(value.body));
        if(test==false){
          null;
        }else{
          CacheHelper.saveData(key: "test",value: statusObject.status);
        }
        test =  statusObject.data;
        notifyListeners();
      } else {
        test = false;
        notifyListeners();
      }
    });
  }

  late HomeModel homeObject;

  bool homeLoading = true;

  void changeHomeStatus(bool value) {
    homeLoading = value;
    notifyListeners();
  }

  Future getSellerHomeData(BuildContext context) async {
    changeHomeStatus(true);
    await HttpHelper.getData(
      urlPath: "https://mulla.hwzn.sa/project/public/api/home",
    ).then((value) {
      log(value.body);
      if (value.statusCode == 200) {
        homeObject = HomeModel.fromJson(json.decode(value.body));
        changeHomeStatus(false);
      } else {
        changeHomeStatus(true);
      }
    });
  }

  late ProductModel productModel;

  bool productLoading = true;

  void changeProductStatus(bool value) {
    productLoading = value;
    notifyListeners();
  }

  List<ProductModel> list = [];
  Future getProductData(BuildContext context) async {
    changeProductStatus(true);
    await HttpHelper.getData(
      urlPath: "https://fakestoreapi.com/products",
    ).then((value) {
      log(value.body);
      if (value.statusCode == 200) {
        // productModel = ProductModel.fromJson(json.decode(value.body));
        List data = json.decode(value.body);
        for (var dat in data) {
          list.add(ProductModel(
              id: dat["id"],
              title: dat["title"],
              image: dat["image"],
              price: dat["price"],
              description: dat["description"]));
        }
        print(list);
        changeProductStatus(false);
      } else {
        changeProductStatus(true);
      }
    });
  }


  late ProductDetailsModel productDetailsObject;

  bool productDetailsLoading = true;

  void changeProductDetaislStatus(bool value) {
    productDetailsLoading = value;
    notifyListeners();
  }

  Future getProductDetailsData(BuildContext context,String id) async {
    changeProductDetaislStatus(true);
    await HttpHelper.getData(
      urlPath: "https://fakestoreapi.com/products/$id",
    ).then((value) {
      log(value.body);

      if (value.statusCode == 200) {
        productDetailsObject = ProductDetailsModel.fromJson(json.decode(value.body));
        changeProductDetaislStatus(false);
      } else {
        changeProductDetaislStatus(true);
      }
    });
  }

  late BooksModel bookObject;

  bool bookLoading = true;

  void changeBookStatus(bool value) {
    bookLoading = value;
    notifyListeners();
  }

  Future getBookData(BuildContext context) async {
    changeBookStatus(true);
    await HttpHelper.getData(
      urlPath: "https://mulla.hwzn.sa/project/public/api/books",
    ).then((value) {
      log(value.body);

      if (value.statusCode == 200) {
        bookObject = BooksModel.fromJson(json.decode(value.body));
        changeBookStatus(false);
      } else {
        changeBookStatus(true);
      }
    });
  }

  late BookDetailsModel bookDetailsObject;

  bool bookDetailsLoading = true;

  void changeBookDetailsStatus(bool value) {
    bookDetailsLoading = value;
    notifyListeners();
  }

  Future getBookDetailsData(BuildContext context, String id) async {
    changeBookDetailsStatus(true);
    await HttpHelper.postData(
      urlPath: "https://mulla.hwzn.sa/project/public/api/bookDetailsById",
      body: {"book_id": id},
    ).then((value) {
      log(value.body);

      if (value.statusCode == 200) {
        bookDetailsObject = BookDetailsModel.fromJson(json.decode(value.body));
        changeBookDetailsStatus(false);
      } else {
        changeBookDetailsStatus(true);
      }
    });
  }
}
