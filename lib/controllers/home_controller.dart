import 'package:el_mola/models/category.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  List<CategoryModel> categories = [
    CategoryModel(id: "0", title: 'فقه'),
    CategoryModel(id: "1", title: 'حديث'),
    CategoryModel(id: "2", title: 'تجويد'),
    CategoryModel(id: "3", title: 'ادعية'),
    CategoryModel(id: "4", title: 'لغة عربية'),
    CategoryModel(id: "5", title: 'سيرة نبوية'),
    // CategoryModel(id: "5", title: 'سيرة نبوية'),
  ];

  List<CategoryModel> selectedCategories = [];
  List<int> selectedCategoriesId = [];
}