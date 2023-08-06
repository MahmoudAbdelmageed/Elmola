// To parse this JSON data, do
//
//     final bookDetailsModel = bookDetailsModelFromJson(jsonString);

import 'dart:convert';

BookDetailsModel bookDetailsModelFromJson(String str) => BookDetailsModel.fromJson(json.decode(str));

String bookDetailsModelToJson(BookDetailsModel data) => json.encode(data.toJson());

class BookDetailsModel {
  BookDetailsModel({
    required this.data,
    required this.message,
    required this.status,
  });

  Data data;
  String message;
  bool status;

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) => BookDetailsModel(
    data: Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  Data({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.name,
    required this.author,
    required this.description,
    required this.image,
    required this.book,
  });

  int id;
  int categoryId;
  String categoryName;
  String name;
  String author;
  String description;
  String image;
  String book;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    name: json["name"],
    author: json["author"],
    description: json["description"],
    image: json["image"],
    book: json["book"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "category_name": categoryName,
    "name": name,
    "author": author,
    "description": description,
    "image": image,
    "book": book,
  };
}
