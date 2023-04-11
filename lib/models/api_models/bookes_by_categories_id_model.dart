// To parse this JSON data, do
//
//     final categoriesIdModel = categoriesIdModelFromJson(jsonString);

import 'dart:convert';

CategoriesIdModel categoriesIdModelFromJson(String str) => CategoriesIdModel.fromJson(json.decode(str));

String categoriesIdModelToJson(CategoriesIdModel data) => json.encode(data.toJson());

class CategoriesIdModel {
  CategoriesIdModel({
    required this.data,
    required this.message,
    required this.status,
  });

  List<Datum> data;
  String message;
  bool status;

  factory CategoriesIdModel.fromJson(Map<String, dynamic> json) => CategoriesIdModel(
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
    required this.description,
    required this.image,
  });

  int id;
  String name;
  String description;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
  };
}
