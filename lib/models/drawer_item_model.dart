import 'package:flutter/material.dart';

class DrawerItemModel{
  late String title;
  late VoidCallback function;
  DrawerItemModel({required this.title,required this.function});
}