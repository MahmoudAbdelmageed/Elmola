import 'dart:developer';

import 'package:el_mola/controllers/home_controller.dart';
import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/models/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_text.dart';

class FilterCategoryWidget extends StatelessWidget {
  FilterCategoryWidget({Key? key, required this.index, required this.categoryModel, this.selected = false}) : super(key: key);
  final int index;
  final CategoryModel categoryModel;
  bool selected;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder:(controller)=> InkWell(
        onTap: (){
          log("index==> $index");
          controller.selectedCategories.contains(categoryModel)
              ? controller.selectedCategories.remove(categoryModel)
              : controller.selectedCategories.add(categoryModel);
          controller.update();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: controller.selectedCategories.contains(categoryModel)
                ? AppTheme.primaryColor
                : const Color(0xfff3f3f3),
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            shape: BoxShape.rectangle,
          ),
          alignment: Alignment.center,
          child: AppText(categoryModel.title!, fontSize: 18, fontWeight: FontWeight.bold,
            maxLines: 2, color: controller.selectedCategories.contains(categoryModel)
                ? Colors.white
                : Colors.black),
        ),
      ),
    );
  }
}