// To parse this JSON data, do
//
//     final statusModel = statusModelFromJson(jsonString);

import 'dart:convert';

StatusModel statusModelFromJson(String str) => StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel {
  StatusModel({
    required this.data,
    required this.message,
    required this.status,
  });

  bool data;
  String message;
  bool status;

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
    data: json["data"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "status": status,
  };
}
