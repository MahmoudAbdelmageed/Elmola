// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    required this.data,
    required this.message,
    required this.status,
  });

  List<Datum> data;
  String message;
  bool status;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.booksCount,
  });

  int id;
  String name;
  int booksCount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    booksCount: json["books_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "books_count": booksCount,
  };
}
