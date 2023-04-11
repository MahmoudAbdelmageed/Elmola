// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    required this.data,
    required this.message,
    required this.status,
  });

  Data data;
  String message;
  bool status;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
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
    required this.banner,
    required this.latest,
    required this.mostRead,
  });

  List<Banner> banner;
  List<Banner> latest;
  List<Banner> mostRead;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
    latest: List<Banner>.from(json["latest"].map((x) => Banner.fromJson(x))),
    mostRead: List<Banner>.from(json["most_read"].map((x) => Banner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
    "latest": List<dynamic>.from(latest.map((x) => x.toJson())),
    "most_read": List<dynamic>.from(mostRead.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  int id;
  String name;
  String description;
  String image;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    name: json["name"]!,
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name":name,
    "description": description,
    "image": image,
  };
}

